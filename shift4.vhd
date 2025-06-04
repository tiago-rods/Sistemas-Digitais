-- Arquivo: shift4.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.shift_package.all;

ENTITY shift4 IS
    PORT (
        R : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        L, w, Clock : IN STD_LOGIC;
        Q : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END shift4;

ARCHITECTURE Structure OF shift4 IS
BEGIN
Stage3: muxdff PORT MAP ( w, R(3), L, Clock, Q(3) ) ;
Stage2: muxdff PORT MAP ( Q(3), R(2), L, Clock, Q(2) ) ;
Stage1: muxdff PORT MAP ( Q(2), R(1), L, Clock, Q(1) ) ;
Stage0: muxdff PORT MAP ( Q(1), R(0), L, Clock, Q(0) ) ;
END Structure;