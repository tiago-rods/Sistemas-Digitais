LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparador IS 
	PORT (
	a,b : IN std_logic_vector (3 downto 0);
	AgtB, AltB, AeqB : OUT std_logic);
END comparador;

Architecture logicaComparador of comparador is
	SIGNAL i, j : std_logic_vector (3 downto 0);
	SIGNAL igual, maior, menor : std_logic;
	
	BEGIN
	
	i(0) <= (a(0) XNOR b(0)); 
	i(1) <= (a(1) XNOR b(1)); 
	i(2) <= (a(2) XNOR b(2)); 
	i(3) <= (a(3) XNOR b(3)); 
	 
	 
	j(0) <= (a(3) AND NOT b(3));
	j(1) <= (i(3) AND NOT b(2) AND a(2));
	j(2) <= (i(3) AND i(2) AND NOT b(1) AND a(1));
	j(3) <= (i(3) AND i(2) AND i(1) AND NOT b(0) AND a(0));
	
	igual <= (i(0) AND i(1) AND i(2) AND i(3));
	maior <= (j(0) OR j(1) OR j(2) OR j(3));
	menor <= (igual NOR maior);
	
	AeqB <= igual;
	AgtB <= maior;
	AltB <= menor;
	
END logicaComparador;