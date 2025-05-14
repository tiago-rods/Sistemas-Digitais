library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
  port(
    X  : in  std_logic_vector(1 downto 0); --X1 e X2, entradas
    En : in  std_logic;  --Enable
    Y  : out std_logic_vector(3 downto 0) -- saidas Y0 a Y3, estes serao os enables da proxima fileira de decoders
  );
end entity dec2to4;

architecture behavior of dec2to4 is
begin
  process (X,En) --processo que recebe X e Enable
  begin
    if En = '1' then --Caso enable esteja ativo, permite a decodificação
      case X is
        when "00" => Y <= "0001"; --seleciona um dos Y`s a partir dos valores de X
        when "01" => Y <= "0010";
        when "10" => Y <= "0100";
        when "11" => Y <= "1000";
        when others => Y <= "0000";
      end case;
    else
      Y <= "0000"; -- caso En seja 0, não permite decodificação
    end if;
  end process;
end architecture behavior;
