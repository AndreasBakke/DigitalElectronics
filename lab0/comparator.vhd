LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ENTITY comparator IS
	PORT(
	SW: IN std_logic_vector(7 DOWNTO 0);
	HEX0: OUT std_logic_Vector(0 TO 6);
	HEX1: OUT std_logic_vector(0 TO 6);
	LEDR: OUT std_logic_vector(5 DOWNTO 0)
	);

BEGIN
END comparator;


ARCHITECTURE Behav OF comparator IS
	COMPONENT segment_decoder_7 IS
	PORT(
		SW: IN std_logic_vector(3 DOWNTO 0);
		HEX0: OUT std_logic_vector(6 DOWNTO 0)
	);
	END COMPONENT;
	SIGNAL ltucomp, equcomp, gtucomp, ltscmp, eqscmp, gtscmp: std_logic;
BEGIN
	
    segment_1: segment_decoder_7 PORT MAP(SW(3 DOWNTO 0), HEX0);
    segment_2: segment_decoder_7 PORT MAP(SW(7 DOWNTO 4), HEX1);
	PROCESS(SW)
	BEGIN
		-- USIGNED
		IF unsigned(SW(7 DOWNTO 4)) < unsigned(SW(3 DOWNTO 0)) THEN
		ltucomp <= '1'; equcomp <= '0'; gtucomp <= '0';
		ELSIF unsigned(SW(7 DOWNTO 4)) = unsigned(SW(3 DOWNTO 0)) THEN
		ltucomp <= '0'; equcomp <= '1'; gtucomp <= '0';
		ELSE
		ltucomp <= '0'; equcomp <= '0'; gtucomp <= '1';
		END IF;
		
		--SIGNED
		IF signed(SW(7 DOWNTO 4)) < signed(SW(3 DOWNTO 0)) THEN
		ltscmp <= '1'; eqscmp <= '0'; gtscmp <= '0';
		ELSIF signed(SW(7 DOWNTO 4)) = signed(SW(3 DOWNTO 0)) THEN
		ltscmp <= '0'; eqscmp <= '1'; gtscmp <= '0';
		ELSE
		ltscmp <= '0'; eqscmp <= '0'; gtscmp <= '1';
		END IF;
		
		LEDR(0) <= ltucomp;
		LEDR(1) <= equcomp;
		LEDR(2) <= gtucomp;
		LEDR(3) <= ltscmp;
		LEDR(4) <= eqscmp;
		LEDR(5) <= gtscmp;
		
	END PROCESS;
END Behav;