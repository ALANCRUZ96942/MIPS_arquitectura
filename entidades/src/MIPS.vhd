			library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MIPS is		 

	--ELEMENTOS DE MIPS	
	Generic (size: integer := 32);
	Port (
	InGeneral : in  STD_LOGIC_VECTOR(size-1 downto 0);
	OutGeneral: out STD_LOGIC_VECTOR(size-1 downto 0)
	mainClock: in std_logic;
	);	  

end MIPS;

architecture structural of MIPS is 

	component InstructionMemory is
		Generic (size: integer := 32);
    	Port (
		AddressIM : in  STD_LOGIC_VECTOR(size-1 downto 0);
		Instruction : out STD_LOGIC_VECTOR (size-1 downto 0);
		Clock : in STD_LOGIC);
	end component;	 
	
	
	component MUX1 is
		 Generic(size:integer := 32);
	    Port (
			Data1, Data2: in  STD_LOGIC_VECTOR(size-1 downto 0);
			Selector: in STD_LOGIC;
			Result: out STD_LOGIC_VECTOR(size-1 downto 0));
	end component;

	component Registers is
	Generic(size:integer := 32);
    Port (
		ReadADR1, ReadADR2: in  STD_LOGIC_VECTOR(size-1 downto 0); --Address inputs (5 bits)
	 	WriteADR1 : IN STd_logic_vector(4 downto 0);
		WriteReadSEL, clock : in STD_LOGIC; --Control signals: WriteReadSEL	= 0: writing disabled
		DataIn1: in STD_LOGIC_VECTOR (size-1 downto 0); --Data Input to be saved (32 bits)
		DataOut1, DataOut2: out STD_LOGIC_VECTOR(size-1 downto 0)); --Data output (32 bits)
	end component;
	
	signal Instruction: std_logic_vector(31 downto 0);
	
	
	
begin 
																									
	instruction_memory: InstructionMemory port map (AddressIM => InGeneral,Instruction => Instruction, Clock => mainClock);	
	mux1: MUX1 port map(Data1,Data2,Selector,Result)
	registers: Registers port map (ReadADR1 => Instruction, ReadADR2 => Instruction, WriteADR1 => ,WriteReadSEL, clock,DataIn1,DataOut1,DataOut2 );	  
	

end architecture;