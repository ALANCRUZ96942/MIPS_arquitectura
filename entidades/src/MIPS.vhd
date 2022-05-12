			library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MIPS is		 

	--ELEMENTOS DE MIPS	
	Generic (size: integer := 32);
	Port (
	Address : in  STD_LOGIC_VECTOR(size-1 downto 0);
	WriteData : in STD_LOGIC_VECTOR (size-1 downto 0);
	MemoryWrite, MemoryRead, Clock : in STD_LOGIC;
	ReadData: out STD_LOGIC_VECTOR(size-1 downto 0));

end MIPS;

architecture structural of MIPS is 

	component pc is	
	    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
		Output : out STD_LOGIC_VECTOR (31 downto 0);  
		clock : in STD_logic);		
	end component;

	component ALUS1 is	
		port (
		a 			: in std_logic_vector (31 downto 0); --operador1
		b 			: in std_logic_vector (31 downto 0); --operador2
		operacion	: in std_logic_vector (3 downto 0); --selector
		result 		: out std_logic_vector (31 downto 0); --resultado
		carry_out	: out std_logic;
		cero 		: out std_logic 
		);	
	end component;
	
	
	
	
	
	


begin 
	
	--ALUS1 port map (a,b	   ..., 
end architecture;