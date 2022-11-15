LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY VGA_controller_tb IS
BEGIN
END VGA_controller_tb;


ARCHITECTURE TBArch of VGA_controller_tb IS
    COMPONENT VGA_controller IS
         PORT(
            KEY: IN std_logic_vector(0 DOWNTO 0) := "1"; --async reset button KEY(0) active low
            CLOCK_50: IN std_logic := '0'; -- 50MHZ clock signal.
            VGA_R: OUT std_logic_vector(7 DOWNTO 0); --VGA red signals
            VGA_G: OUT std_logic_vector(7 DOWNTO 0); --VGA green signals
            VGA_B: OUT std_logic_vector(7 DOWNTO 0); --VGA blue signals
            VGA_CLK: OUT std_logic; -- VGA clock (should we use this)?
            VGA_BLANK_N: OUT std_logic := '1'; -- Not used, but need to be driven correctly
            VGA_HS: OUT std_logic;
            VGA_VS: OUT std_logic;
            VGA_SYNC_N: OUT std_logic := '1' -- Not used, but need to be driven correctly
        );
    END COMPONENT;

    SIGNAL KEY_s: std_logic_vector(0 DOWNTO 0);
    signal clock_50_s, VGA_CLK_s, VGA_BLANK_N_s, VGA_HS_s, VGA_VS_s, VGA_SYNC_N_s: std_logic;
    SIGNAL VGA_R_s, VGA_G_s, VGA_B_s: std_logic_vector(7 DOWNTO 0);
    
    CONSTANT clk_period: time := 2ps;  --Sped up for sake of simulation
BEGIN
    dut: VGA_controller
        PORT MAP(
        KEY => KEY_s, CLOCK_50 => CLOCK_50_s, VGA_R => VGA_R_s, VGA_G => VGA_G_s, VGA_B => VGA_B_s,
        VGA_CLK => VGA_CLK_s, VGA_HS => VGA_HS_s, VGA_VS => VGA_VS_s, VGA_SYNC_N => VGA_SYNC_N_s, VGA_BLANK_N => VGA_BLANK_N_s
        );
    
    clock_generation: PROCESS
    BEGIN
        CLOCK_50_s <= '0';
        WAIT FOR (clk_period/2);
        CLOCK_50_s <= '1';
        WAIT FOR (clk_period/2);
    END PROCESS;
        
    test_vector: PROCESS
    BEGIN
        KEY_s <= "1";
        WAIT FOR 1ns;
        KEY_S <= "0";
        WAIT FOR 0.2ns;
        KEY_s <= "1";
        WAIT;
    
    END PROCESS; --test_vector
    


END TBarch;