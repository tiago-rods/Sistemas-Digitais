-- Arquivo: mux2to1.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS
    PORT (
        D0, D1, Sel : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END mux2to1;

ARCHITECTURE Behavior OF mux2to1 IS
BEGIN
    PROCESS(D0, D1, Sel)
    BEGIN
        IF Sel = '0' THEN
            Y <= D0;
        ELSE
            Y <= D1;
        END IF;
    END PROCESS;
END Behavior;