library ieee;
use ieee.std_logic_1164.all;
use work.Dec4to16_Pkg.all;

entity top_dec4to16 is
   port (
      SW   : in  std_logic_vector(3 downto 0);
      LEDR : out std_logic_vector(15 downto 0)
   );
end entity top_dec4to16;

architecture structural of top_dec4to16 is
   
begin
   U1: dec4to16 port map (
      A => SW,
      E => '1',
      Y => LEDR
   );
end architecture structural;
