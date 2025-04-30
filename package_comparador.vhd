LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE package_comparador IS
	COMPONENT Comparador
		PORT (
			a, b: IN STD_LOGIC_VECTOR (3 downto 0);
			AltB, AgtB, AeqB: OUT STD_LOGIC
			
		);
	END COMPONENT;
END package_comparador;	