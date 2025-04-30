LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.package_comparador.all;

ENTITY Lab_09 IS
	PORT (
		
		SW: IN STD_LOGIC_VECTOR (10 downto 3);
		
		HEX1, HEX2: OUT STD_LOGIC_VECTOR (0 to 6);
		
		LEDR: OUT STD_LOGIC_VECTOR (3 to 5)
	);
END Lab_09;

ARCHITECTURE LogicaLab_09 OF Lab_09 IS
		SIGNAL a, b: STD_LOGIC_VECTOR (3 DOWNTO 0);
		SIGNAL AeqB, AgtB, AltB: STD_LOGIC;
		
		BEGIN
		
		a(0) <= SW(7);
		a(1) <= SW(8);
		a(2) <= SW(9);
		a(3) <= SW(10);
		
		b(0) <= SW(3);
		b(1) <= SW(4);
		b(2) <= SW(5);
		b(3) <= SW(6);
		
		LEDR(3) <= AeqB;
		LEDR(4) <= AgtB;
		LEDR(5) <= AltB;
		
		comparar: Comparador PORT MAP (a, b, AeqB, AgtB, AltB);
		
		WITH a SELECT
			HEX1 <=  "0000001" when "0000",  -- 0
            "1001111" when "0001",  -- 1
            "0010010" when "0010",  -- 2
            "0000110" when "0011",  -- 3
            "1001100" when "0100",  -- 4
            "0100100" when "0101",  -- 5
            "0100000" when "0110",  -- 6
            "0001111" when "0111",  -- 7
            "0000000" when "1000",  -- 8
            "0000100" when "1001",  -- 9
            "0001000" when "1010",  -- A
            "1100000" when "1011",  -- B
            "0110001" when "1100",  -- C
            "1000010" when "1101",  -- D
            "0110000" when "1110",  -- E
            "0111000" when "1111",  -- F
            "1111111" when others;

				
	WITH b SELECT
		HEX2 <=  "0000001" when "0000",
            "1001111" when "0001", 
            "0010010" when "0010", 
            "0000110" when "0011", 
            "1001100" when "0100", 
            "0100100" when "0101", 
            "0100000" when "0110", 
            "0001111" when "0111", 
            "0000000" when "1000", 
            "0000100" when "1001", 
            "0001000" when "1010", 
            "1100000" when "1011", 
            "0110001" when "1100", 
            "1000010" when "1101", 
            "0110000" when "1110", 
            "0111000" when "1111",
            "1111111" when others;

end LogicaLab_09;
		
		