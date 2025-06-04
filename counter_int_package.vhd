-- Arquivo: counter_int_package.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE counter_int_package IS
    COMPONENT upcount_int IS
        PORT (
            R : IN INTEGER RANGE 0 TO 15;
            Clock, Resetn, L, E : IN STD_LOGIC;
            Q : BUFFER INTEGER RANGE 0 TO 15
        );
    END COMPONENT;
    
    COMPONENT bcd_to_7seg IS
        PORT (
            bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT sw_to_integer IS
        PORT (
            sw_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            int_out : OUT INTEGER RANGE 0 TO 15
        );
    END COMPONENT;
    
    COMPONENT integer_to_bcd IS
        PORT (
            int_in : IN INTEGER RANGE 0 TO 15;
            bcd_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
END PACKAGE counter_int_package;