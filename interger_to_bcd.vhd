-- Arquivo: integer_to_bcd.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY integer_to_bcd IS
    PORT (
        int_in : IN INTEGER RANGE 0 TO 15;
        bcd_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END integer_to_bcd;

ARCHITECTURE Behavior OF integer_to_bcd IS
BEGIN
    PROCESS(int_in)
    BEGIN
        CASE int_in IS
            WHEN 0  => bcd_out <= "0000";
            WHEN 1  => bcd_out <= "0001";
            WHEN 2  => bcd_out <= "0010";
            WHEN 3  => bcd_out <= "0011";
            WHEN 4  => bcd_out <= "0100";
            WHEN 5  => bcd_out <= "0101";
            WHEN 6  => bcd_out <= "0110";
            WHEN 7  => bcd_out <= "0111";
            WHEN 8  => bcd_out <= "1000";
            WHEN 9  => bcd_out <= "1001";
            WHEN 10 => bcd_out <= "1010";
            WHEN 11 => bcd_out <= "1011";
            WHEN 12 => bcd_out <= "1100";
            WHEN 13 => bcd_out <= "1101";
            WHEN 14 => bcd_out <= "1110";
            WHEN 15 => bcd_out <= "1111";
            WHEN OTHERS => bcd_out <= "0000";
        END CASE;
    END PROCESS;
END Behavior;