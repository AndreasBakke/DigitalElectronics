LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY synchronous_counter_tb IS
BEGIN
END synchronous_counter_tb;


ARCHITECTURE TBArch of synchronous_counter_tb IS
    CONSTANT N: natural := 16;
    COMPONENT synchronous_counter IS
        GENERIC(N: integer := 16);
        PORT(
        clk, RSTn, clear, en, UDn: IN std_logic;
        value: OUT std_logic_vector(N-1 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk_s, RSTn_s, clear_s, en_s, UDn_s: std_logic;
    SIGNAL value_s: std_logic_vector(N-1 DOWNTO 0);
    
    CONSTANT ClockPeriod : TIME := 20 ns;
BEGIN
    synchronous_counter_1: synchronous_counter
        GENERIC MAP(N=> N)
        PORT MAP(clk => clk_s, RSTn => RSTn_s, clear => clear_s, en => en_s, UDn => UDn_s, value => value_S);
    
    clock: PROCESS
    BEGIN
        clk_s <= '0';
        WAIT FOR (ClockPeriod/2);
        clk_s <= '1';
        WAIT FOR (ClockPeriod/2);
    END PROCESS; --clock
    
    
    
    Testing: PROCESS
    BEGIN
        RSTn_s <= '0'; clear_s <= '0'; en_s <= '0'; UDn_s <= '0';
        wait for 2ns;
        RSTn_s <= '1';
        wait for 12ns; -- t= 14ns
        en_s <= '1';
        wait for 38ns; --t= 52 ns;
        en_s <= '0';
        wait for 10ns; --t= 62ns;
        clear_s <=  '1';
        wait for 2ns; -- t= 64ns;
        en_s <= '1';
        wait for 1ns; --t=65ns;
        UDn_s <= '1';
        wait for 10ns; --t=75ns;
        clear_s <= '0';
        wait for (ClockPeriod*15);
        clear_s<='1'; UDn_s <= '0';
        wait for (ClockPeriod);
        clear_s <='0';
    
        
        wait;
    END PROCESS; --Testing
END TBArch;