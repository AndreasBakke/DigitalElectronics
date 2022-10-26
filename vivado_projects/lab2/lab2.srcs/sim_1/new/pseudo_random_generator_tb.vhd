LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY pseudo_random_generator_tb IS
BEGIN
END pseudo_random_generator_tb;

ARCHITECTURE TBarch OF pseudo_random_generator_tb IS
    COMPONENT pseudo_random_generator IS
        PORT(
            CLOCK_50, KEY_0: IN std_logic;
            LEDR: OUT std_logic_vector(9 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL CLOCK_50_s, KEY_0_s : std_logic;
    SIGNAL LEDR_s: std_logic_vector(9 DOWNTO 0);
BEGIN
    dut: pseudo_random_generator
        PORT MAP(CLOCK_50 => CLOCK_50_s, KEY_0 => KEY_0_s, LEDR => LEDR_s);
        
    clock: PROCESS
    BEGIN
        CLOCK_50_s <= '0';
        wait for 10ns;
        CLOCK_50_s <= '1';
        wait for 10ns;
    END PROCESS;

    comb: PROCESS
    BEGIN
        KEY_0_s <= '0';
        wait for 5ns;
        KEY_0_s <= '1';
        wait for 117ns; --122ns
        KEY_0_s <= '0';
        wait for 20ns;
        KEY_0_s <= '1';
        wait;
    END PROCESS;
END ARCHITECTURE;