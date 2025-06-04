-- Arquivo: top_level.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab12_atividade1 IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(2 DOWNTO 0);  -- SW(0)=D0, SW(1)=D1, SW(2)=SEL
        KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0); -- KEY(0)=Clock
        LEDR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- LEDR(0)=Q, LEDR(1)=D1, LEDR(2)=SEL
    );
END lab12_atividade1;

ARCHITECTURE Behavior OF lab12_atividade1 IS
    COMPONENT muxdff IS
        PORT (
            D0, D1, Sel, Clock : IN STD_LOGIC;
            Q : OUT STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL clock_debounced : STD_LOGIC;
    
BEGIN
    -- Instanciação do FF D com MUX
    U1: muxdff PORT MAP (
        D0 => SW(0),        -- D0 conectado a SW(0)
        D1 => SW(1),        -- D1 conectado a SW(1)
        Sel => SW(2),       -- SEL conectado a SW(2)
        Clock => NOT KEY(0), -- Clock conectado a KEY(0) (invertido pois KEY é ativo baixo)
        Q => LEDR(0)        -- Q conectado a LEDR(0)
    );
    
    -- Saídas de monitoramento
    LEDR(1) <= SW(1);      -- D1 para LEDR(1)
    LEDR(2) <= SW(2);      -- SEL para LEDR(2)
    
END Behavior;