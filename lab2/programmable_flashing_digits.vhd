LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY programmable_flashing_digits IS
    PORT(
    SW: IN std_logic_vector(1 DOWNTO 0);
    KEY0: IN std_logic;
    CLOCK_50: IN std_logic;
    HEX0: OUT std_logic_vector(0 TO 6)
    );
BEGIN
END programmable_flashing_digits;


ARCHITECTURE Behav of programmable_flashing_digits IS
    COMPONENT synchronous_counter IS
        GENERIC(N: integer := 16);
        PORT(
        clk, RSTn, clear, en, UDn: IN std_logic;
        value: OUT std_logic_vector(N-1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT segment_decoder_7 IS
        PORT(
		  SW: IN std_logic_vector(3 DOWNTO 0);
		  HEX0: OUT std_logic_vector(0 TO 6)
        );
    END COMPONENT;
    
    SIGNAL hex_0_driver: std_logic_vector(0 TO 3);
    SIGNAL count: std_logic_vector(31 downto 0);
    SIGNAL t: std_logic_vector(3 DOWNTO 0);
    SIGNAL clearcount, alert: std_logic;
    CONSTANT delay_2000: integer:= 99999999;
    CONSTANT delay_1000: integer:= 49999999;
    CONSTANT delay_500: integer := 24999999;
    CONSTANT delay_250: integer := 12499999;

    
BEGIN
    hex_1: segment_decoder_7 
    PORT MAP(SW=> hex_0_driver, HEX0 => HEX0);


    
    counter: synchronous_counter 
        GENERIC MAP(N=> 32)
        PORT MAP(clk => CLOCK_50, RSTn => KEY0, clear => clearcount, en => '1', UDn => '0', value => count);
    
	 alerter: PROCESS(count)
		variable delay: integer := 0;
	 BEGIN
	   IF SW = "00" THEN
	       delay := delay_2000;
	   ELSIF SW = "01" THEN
	       delay := delay_1000;
	   ELSIF SW = "10" THEN
	       delay := delay_500;
	   ELSIF SW = "11" THEN
	       delay := delay_250;
	   END IF;
        
        IF unsigned(count) = delay THEN -- 9 simulation change to 49 999 999 for implementation
           alert <= '1';
           clearcount <= '1';
        ELSE
            alert <= '0';
            clearcount <= '0';
        END IF;
   
	 END PROCESS; --alerter
	 
	 
    signal_driver: PROCESS(alert)
        variable s: integer := 0;
     BEGIN
			IF s = 9 THEN
				 s := 0;
			ELSE
				 s := s+1;
			END IF;
			hex_0_driver <= std_logic_vector(to_unsigned(s, 4));
     END PROCESS;

END Behav;