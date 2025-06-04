-- Arquivo: mux_package.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE mux_package IS
    COMPONENT mux2to1 IS
        PORT (
            D0, D1, Sel : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;
END PACKAGE mux_package;