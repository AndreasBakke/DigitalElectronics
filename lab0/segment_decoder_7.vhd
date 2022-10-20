LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY segment_decoder_7 IS
	PORT(
		SW: IN std_logic_vector(3 DOWNTO 0);
		HEX0: OUT std_logic_vector(0 TO 6)
	);
BEGIN
END segment_decoder_7;


ARCHITECTURE Behav OF segment_decoder_7 IS
BEGIN
	PROCESS(SW)
	BEGIN
		CASE SW IS
			WHEN "0000" => HEX0 <= "0000001"; --0
			WHEN "0001" => HEX0 <= "1001111"; --1
			WHEN "0010" => HEX0 <= "0010010"; --2
			WHEN "0011" => HEX0 <= "0000110";--3
			WHEN "0100" => HEX0 <= "1001100"; --4
			WHEN "0101" => HEX0 <= "0100100"; --5
			WHEN "0110" => HEX0 <= "0100000"; --6
			WHEN "0111" => HEX0 <= "0001111"; --7
			WHEN "1000" => HEX0 <= "0000000"; --8
			WHEN "1001" => HEX0 <= "0000100"; --9
			WHEN "1010" => HEX0 <= "0001000"; --A
			WHEN "1011" => HEX0 <= "1100000"; --B
			WHEN "1100" => HEX0 <= "0110001"; --C
			WHEN "1101" => HEX0 <= "1000010"; --D
			WHEN "1110" => HEX0 <= "0110000"; --E
			WHEN "1111" => HEX0 <= "0111000"; --F
		END CASE;
	END PROCESS;
END Behav;



