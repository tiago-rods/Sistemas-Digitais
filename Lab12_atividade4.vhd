-- Arquivo: top_level_counter_int.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.counter_int_package.all;

ENTITY lab12_atividade4 IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);   -- SW(3..0)=R, SW(0)=E, SW(5)=W
        KEY : IN STD_LOGIC_VECTOR(2 DOWNTO 0);  -- KEY(0)=Clock, KEY(1)=Resetn, KEY(2)=L
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display para Q
        HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display para R
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)  -- LEDs para debug
    );
END lab12_atividade4;

ARCHITECTURE Behavior OF lab12_atividade4 IS
    SIGNAL R_internal : INTEGER RANGE 0 TO 15;
    SIGNAL Q_internal : INTEGER RANGE 0 TO 15;
    SIGNAL Q_bcd, R_bcd : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
BEGIN
    -- Conversor de switches para integer
    U1: sw_to_integer PORT MAP (
        sw_in => SW(3 DOWNTO 0),
        int_out => R_internal
    );
    
    -- Instanciação do contador
    U2: upcount_int PORT MAP (
        R => R_internal,
        Clock => NOT KEY(0),    -- Clock (invertido - ativo baixo)
        Resetn => KEY(1),       -- Resetn (ativo baixo)
        L => NOT KEY(2),        -- L (invertido - ativo baixo)
        E => SW(0),             -- E (enable)
        Q => Q_internal
    );
    
    -- Conversor de integer para BCD (saída Q)
    U3: integer_to_bcd PORT MAP (
        int_in => Q_internal,
        bcd_out => Q_bcd
    );
    
    -- Conversor de integer para BCD (entrada R)
    U4: integer_to_bcd PORT MAP (
        int_in => R_internal,
        bcd_out => R_bcd
    );
    
    -- Display para Q (saída do contador)
    U5: bcd_to_7seg PORT MAP (
        bcd => Q_bcd,
        seg => HEX0
    );
    
    -- Display para R (entrada de carga)
    U6: bcd_to_7seg PORT MAP (
        bcd => R_bcd,
        seg => HEX1
    );
    
    -- LEDs para debug
    LEDR(3 DOWNTO 0) <= Q_bcd;       -- Q em binário
    LEDR(4) <= SW(0);                -- E (enable)
    LEDR(5) <= SW(5);                -- W (não usado)
    LEDR(6) <= NOT KEY(0);           -- Clock
    LEDR(7) <= KEY(1);               -- Resetn
    LEDR(8) <= NOT KEY(2);           -- L (load)
    LEDR(9) <= '0';                  -- Não usado
    
END Behavior;