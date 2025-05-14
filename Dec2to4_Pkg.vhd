library ieee;
use ieee.std_logic_1164.all;

package Dec2to4_Pkg is

   component dec2to4
     port(
       A : in  std_logic_vector(1 downto 0);
       E : in  std_logic;
       Y : out std_logic_vector(3 downto 0)
     );
   end component;

end package Dec2to4_Pkg;

package body Dec2to4_Pkg is
end package body Dec2to4_Pkg;
