-- Arquivo: top_level_shift.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.shift_package.all;

ENTITY lab12_atividade2 IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);   -- SW(3..0)=R, SW(5)=w
        KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);  -- KEY(0)=Clock, KEY(1)=L
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display para R
        HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  -- Display para Q
    );
END lab12_atividade2 ;

ARCHITECTURE Behavior OF lab12_atividade2  IS
    COMPONENT bcd_to_7seg IS
        PORT (
            bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL Q_internal : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
BEGIN
    -- Instanciação do registrador de deslocamento
    U1: shift4 PORT MAP (
        R => SW(3 DOWNTO 0),    -- R conectado a SW(3..0)
        L => KEY(1),        -- L conectado a KEY(1) (invertido - ativo baixo)
        w => SW(5),             -- w conectado a SW(5)
        Clock => KEY(0),    -- Clock conectado a KEY(0) (invertido - ativo baixo)
        Q => Q_internal         -- Saída interna
    );
    
    -- Display para mostrar R (entrada)
    U2: bcd_to_7seg PORT MAP (
        bcd => SW(3 DOWNTO 0),
        seg => HEX0
    );
    
    -- Display para mostrar Q (saída)
    U3: bcd_to_7seg PORT MAP (
        bcd => Q_internal,
        seg => HEX2
    );
    
END Behavior;