-- Arquivo: top_level_counter.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.counter_package.all;

ENTITY lab12_atividade3 IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);   -- SW(0)=E, SW(5)=W (não usado)
        KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);  -- KEY(0)=Clock, KEY(1)=Resetn
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display para Q
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)  -- LEDs para debug
    );
END lab12_atividade3;

ARCHITECTURE Behavior OF lab12_atividade3 IS
    SIGNAL Q_internal : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL clock_debounced : STD_LOGIC;
    
BEGIN
    -- Instanciação do contador
    U1: upcount PORT MAP (
        Clock => NOT KEY(0),    -- Clock conectado a KEY(0) (invertido - ativo baixo)
        Resetn => KEY(1),       -- Resetn conectado a KEY(1) (ativo baixo)
        E => SW(0),             -- E conectado a SW(0)
        Q => Q_internal         -- Saída interna
    );
    
    -- Display para mostrar Q (saída do contador)
    U2: bcd_to_7seg PORT MAP (
        bcd => Q_internal,
        seg => HEX0
    );
    
    -- LEDs para debug e monitoramento
    LEDR(3 DOWNTO 0) <= Q_internal;  -- Mostrar Q em binário
    LEDR(4) <= SW(0);                -- Mostrar E
    LEDR(5) <= SW(5);                -- Mostrar W (não usado, mas mapeado)
    LEDR(6) <= NOT KEY(0);           -- Mostrar Clock
    LEDR(7) <= KEY(1);               -- Mostrar Resetn
    LEDR(9 DOWNTO 8) <= "00";        -- LEDs não usados
    
END Behavior;