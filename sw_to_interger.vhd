-- Arquivo: sw_to_integer.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sw_to_integer IS
    PORT (
        sw_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        int_out : OUT INTEGER RANGE 0 TO 15
    );
END sw_to_integer;

ARCHITECTURE Behavior OF sw_to_integer IS
BEGIN
    PROCESS(sw_in)
    BEGIN
        CASE sw_in IS
            WHEN "0000" => int_out <= 0;
            WHEN "0001" => int_out <= 1;
            WHEN "0010" => int_out <= 2;
            WHEN "0011" => int_out <= 3;
            WHEN "0100" => int_out <= 4;
            WHEN "0101" => int_out <= 5;
            WHEN "0110" => int_out <= 6;
            WHEN "0111" => int_out <= 7;
            WHEN "1000" => int_out <= 8;
            WHEN "1001" => int_out <= 9;
            WHEN "1010" => int_out <= 10;
            WHEN "1011" => int_out <= 11;
            WHEN "1100" => int_out <= 12;
            WHEN "1101" => int_out <= 13;
            WHEN "1110" => int_out <= 14;
            WHEN "1111" => int_out <= 15;
            WHEN OTHERS => int_out <= 0;
        END CASE;
    END PROCESS;
END Behavior;