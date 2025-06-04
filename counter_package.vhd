-- Arquivo: counter_package.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;


PACKAGE counter_package IS
    COMPONENT upcount IS
        PORT (
            Clock, Resetn, E : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT bcd_to_7seg IS
        PORT (
            bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;
END PACKAGE counter_package;