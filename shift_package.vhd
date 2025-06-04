-- Arquivo: shift_package.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE shift_package IS
    COMPONENT mux2to1 IS
        PORT (
            D0, D1, Sel : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT muxdff IS
        PORT (
            D0, D1, Sel, Clock : IN STD_LOGIC;
            Q : OUT STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT shift4 IS
        PORT (
            R : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            L, w, Clock : IN STD_LOGIC;
            Q : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
END PACKAGE shift_package;