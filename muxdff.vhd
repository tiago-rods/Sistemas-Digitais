-- Arquivo: muxdff.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.mux_package.all;

ENTITY muxdff IS
    PORT (
        D0, D1, Sel, Clock : IN STD_LOGIC;
        Q : OUT STD_LOGIC
    );
END muxdff;

ARCHITECTURE Behavior OF muxdff IS
    SIGNAL mux_out : STD_LOGIC;
BEGIN
    -- Instanciação do MUX 2:1
    U1: mux2to1 PORT MAP (
        D0 => D0,
        D1 => D1,
        Sel => Sel,
        Y => mux_out
    );
    
    -- Flip-Flop D sensível à borda de subida
    PROCESS(Clock)
    BEGIN
        IF rising_edge(Clock) THEN
            Q <= mux_out;
        END IF;
    END PROCESS;
END Behavior;