library ieee;
use ieee.std_logic_1164.all;

package Dec4to16_Pkg is

   component dec4to16
     port(
       A : in  std_logic_vector(3 downto 0);
       E : in  std_logic;
       Y : out std_logic_vector(15 downto 0)
     );
   end component;

end package Dec4to16_Pkg;

package body Dec4to16_Pkg is
end package body Dec4to16_Pkg;
