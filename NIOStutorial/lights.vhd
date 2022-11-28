-- Implements a simple Nios II system for the DE-series board.
-- Inputs: SW7-0 are parallel port inputs to the Nios II system
-- CLOCK_50 is the system clock
-- KEY0 is the active-low system reset
-- Outputs: LEDR7-0 are parallel port outputs from the Nios II system
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY lights IS
PORT (
CLOCK_50 : IN STD_LOGIC;
KEY : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
SW : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
LEDR : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
);
END lights;
ARCHITECTURE lights_rtl OF lights IS
COMPONENT nios_system
PORT (
clk_clk: IN STD_LOGIC;
reset_reset_n : IN STD_LOGIC;
switches_export : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
leds_export : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
);
END COMPONENT;
BEGIN
NiosII : nios_system
PORT MAP(
clk_clk => CLOCK_50,
reset_reset_n => KEY(0),
switches_export => SW(7 DOWNTO 0),
leds_export => LEDR(7 DOWNTO 0)
);
END lights_rtl;