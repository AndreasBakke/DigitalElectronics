LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


entity pseudo_random_generator is
    PORT(
        CLOCK_50, KEY_0: IN std_logic;
        LEDR: OUT std_logic_vector(9 DOWNTO 0)
    );
begin
end pseudo_random_generator;


architecture behav of pseudo_random_generator is
    signal alert: std_logic;
    
    COMPONENT synchronous_counter IS
        GENERIC(N: integer := 16);
        PORT(
        clk, RSTn, clear, en, UDn: IN std_logic;
        value: OUT std_logic_vector(N-1 DOWNTO 0)
        );
    END COMPONENT;
    signal count: std_logic_vector (31 DOWNTO 0);
    signal clearcount: std_logic;
    signal registers: std_logic_vector(9 DOWNTO 0);
begin
    synchronus_counter_1: synchronous_counter
        GENERIC MAP(N=> 32)
        PORT MAP(clk => CLOCK_50, RSTn=>KEY_0, en=> '1', clear=>clearcount, UDn =>'0', value=>count);
        
     alerter: PROCESS(count)
     BEGIN
         IF unsigned(count) = 49999999 THEN -- 9 simulation change to 49 999 999 for implementation
            alert <= '1';
            clearcount <= '1';
         ELSE
            alert <= '0';
            clearcount <= '0';
         END IF;
     END PROCESS;
    
    lsfr : process(CLOCK_50, KEY_0)
    begin
        if KEY_0 = '0' THEN
            registers <= (OTHERS => '1');
        elsif rising_edge(CLOCK_50) then
            registers(9) <= registers(0);
            registers(8) <= registers(9);
            registers(7) <= registers(8) XOR registers(0);
            registers(6) <= registers(7);
            registers(5) <= registers(6);
            registers(4) <= registers(5);
            registers(3) <= registers(4);
            registers(2) <= registers(3);
            registers(1) <= registers(2);
            registers(0) <= registers(1);
        END IF;
    end process ; -- lsfr
    
    
    led_update: process(alert, KEY_0)
    begin
    IF KEY_0 = '0' THEN
        LEDR <= (OTHERS => '1');
    ELSIF rising_Edge(alert) THEN
        LEDR <= registers;
    END IF;
    end process; --led_update

end behav ; -- behav