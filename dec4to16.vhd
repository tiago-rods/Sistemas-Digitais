library ieee;
use ieee.std_logic_1164.all;
use work.Dec2to4_Pkg.all;

entity dec4to16 is
  port(
    X : in  std_logic_vector(3 downto 0);
    En : in  std_logic;  -- habilitação geral
    Y : out std_logic_vector(15 downto 0)
  );
end entity dec4to16;

architecture Comportamento of dec4to16 is
   signal mid_En  : std_logic_vector(3 downto 0);
   signal dec_out : std_logic_vector(3 downto 0);
begin

   -- Instancia um decodificador 2:4 para gerar os Enables dos proximos decodificadores a partir dos dois bits mais significativos
   ENABLES: dec2to4 
     port map (
       X => X(3 downto 2),
       En => '1',    -- força a habilitação
       Y => mid_En
     );

   -- Instancia quatro decodificadores 2:4 para os dois bits menos significativos,
   -- cada um habilitado pelo respectivo bit de mid_En e pela habilitação geral.
   DEC0: dec2to4 
     port map (
       X => X(1 downto 0),
       En => mid_En(0) and En,
       Y => dec_out(0)
     );
     DEC1: dec2to4 
     port map (
       X => X(1 downto 0),
       En => mid_En(1) and En,
       Y => dec_out(1)
     );
     DEC2: dec2to4 
     port map (
       X => X(1 downto 0),
       En => mid_En(2) and En,
       Y => dec_out(2)
     );
     DEC3: dec2to4 
     port map (
       X => X(1 downto 0),
       En => mid_En(3) and En,
       Y => dec_out(3)
     );

   -- Mapeia cada bloco de 4 bits para o vetor de saída final.
   -- X ordenação é: 
   -- Y(15 downto 12) <- saída do decoder de saida 3
   -- Y(11 downto 8)  <- saída do decoder de saida 2
   -- Y(7 downto 4)   <- saída do decoder de saida 1
   -- Y(3 downto 0)   <- saída do decoder de saida 0
   Y(15 downto 12) <= dec_out(3);
   Y(11 downto 8)  <= dec_out(2);
   Y(3 downto 0)   <= dec_out(1);
   Y(7 downto 4)   <= dec_out(0);

end architecture Comportamento;
