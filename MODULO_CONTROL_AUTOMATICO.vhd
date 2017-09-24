library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MODULO_CONTROL_AUTOMATICO is
  Port ( 
  -- Inputs
        Pasos_realizar         : in std_logic_vector(15 downto 0);
        Seleccion_motores         : in std_logic_vector(2 downto 0);
        Sentido_motores         : in std_logic_vector(2 downto 0);
        Sel_contador         : in std_logic_vector(1 downto 0);
        Start          : in STD_LOGIC;
        clk          : in STD_LOGIC;
        reset        : in STD_LOGIC;
        
  -- Outputs
        Ready        : out STD_LOGIC;
        EjeX_aut         : out std_logic_vector(3 downto 0);  
        EjeY_aut         : out std_logic_vector(3 downto 0);  
        EjeZ_aut         : out std_logic_vector(3 downto 0); 
        Display        : out STD_LOGIC
         
  );
end MODULO_CONTROL_AUTOMATICO;


architecture Estructural of MODULO_CONTROL_AUTOMATICO is

-- Declaracion del componente de control de órdenes 
Component CONTROL_ORDENES   
Port (   
    -- In ports
        Pasos_realizar         : in std_logic_vector(15 downto 0);
        Pasos_realizados         : in std_logic_vector(3 downto 0);
        Seleccion_motores         : in std_logic_vector(2 downto 0);
        Sentido_motores         : in std_logic_vector(2 downto 0);
        Start          : in STD_LOGIC;
        clk          : in STD_LOGIC;
        reset        : in STD_LOGIC;    
        
    -- Out ports
        Ready        : out STD_LOGIC;
        Sentido_EjeX         : out STD_LOGIC;
        Activo_EjeX         : out STD_LOGIC;
        Sentido_EjeY         : out STD_LOGIC;
        Activo_EjeY         : out STD_LOGIC;  
        Sentido_EjeZ         : out STD_LOGIC;
        Activo_EjeZ         : out STD_LOGIC
);
end component;


-- Declaracion del componente de intérprete de órdenes para motores:
Component INTERPRETE_ORDENES   
Port (   
    -- In ports
        Sentido_EjeX         : in STD_LOGIC;
        Activo_EjeX         : in STD_LOGIC;
        Sentido_EjeY         : in STD_LOGIC;
        Activo_EjeY         : in STD_LOGIC;  
        Sentido_EjeZ         : in STD_LOGIC;
        Activo_EjeZ         : in STD_LOGIC;    
        
    -- Out ports
        EjeX_aut         : out std_logic_vector(3 downto 0);  
        EjeY_aut         : out std_logic_vector(3 downto 0);  
        EjeZ_aut         : out std_logic_vector(3 downto 0)
        
);
end component;



-- Declaracion del componente del driver de los motores:
Component DRIVER_MOTORES  
Port (   
    -- In ports
        Activo        : in STD_LOGIC;
        Sentido        : in STD_LOGIC;
        clk          : in STD_LOGIC;
        reset        : in STD_LOGIC;    
        
    -- Out ports
        Pasos_realizados         : out std_logic_vector(3 downto 0)
);
end component;


-- Declaracion del componente del contador de pasos:
Component CONTADOR_PASOS  
Port (   
    -- In ports
        Activo        : in STD_LOGIC;
        Sentido        : in STD_LOGIC;
        clk          : in STD_LOGIC;
        reset        : in STD_LOGIC;    
        
    -- Out ports
        Cuenta         : out std_logic_vector(15 downto 0);
        Cifra_display_dig         : out std_logic_vector(3 downto 0);
        Selec_display_dig         : out std_logic_vector(3 downto 0);
);
end component;

begin


end Estructural;
