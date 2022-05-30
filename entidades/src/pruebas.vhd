																			  			library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity pruebas is		 

Generic (size: integer := 32);
	Port (
	mainClock: in std_logic;
	Branch1, Zero1, Jump1: in STD_LOGIC; 	--Control signals (Boolean)
	SignExtend1: in STD_LOGIC_VECTOR (size-1 downto 0) --From sign extend (32 bits)	
	);  
end pruebas;

architecture structural of pruebas is 	  

----------------------------------------------------------------------------------	

--partes de program counter	 
component PC is
    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
	Output : out STD_LOGIC_VECTOR (31 downto 0);  
	clock : in STD_logic);	

end component;


component PC_SECTION1 is
	Generic(size:integer := 32);
    Port (  
		Branch, Zero, Jump: in STD_LOGIC; 	--Control signals (Boolean)
		SignExtend, Instruction: in STD_LOGIC_VECTOR (size-1 downto 0); --From sign extend (32 bits)
		NextAddress: out  STD_LOGIC_VECTOR(size-1 downto 0);   				--from PC Output  (32 bits)
		ReadAddress: in  STD_LOGIC_VECTOR(size-1 downto 0)					-- form PC Input (32 bits) actual address
		);
end component;

  	component InstructionMemory is
		Generic (size: integer := 32);
    	Port (
		AddressIM : in  STD_LOGIC_VECTOR(size-1 downto 0);
		Instruction : out STD_LOGIC_VECTOR (size-1 downto 0)
		);
	end component;	 
	
	signal Jump: std_logic;
	signal Branch:	 std_logic;
	 signal Instruction: std_logic_vector(31 downto 0);
		
	
	--señales de pc
	signal ShiftLeft: std_logic_vector (31 downto 0); 
	signal ReadAddress: std_logic_vector (31 downto 0); 
	signal NextAddress: std_logic_vector (31 downto 0); 

begin 
	
	nube_pc: PC_SECTION1 port map(Branch  => Branch1, Zero  => Zero1, Jump  => Jump,SignExtend  => SignExtend1, Instruction  => Instruction,NextAddress  =>  NextAddress  ,ReadAddress => ReadAddress);
	program_counter:  PC port map(Input => NextAddress,Output => ReadAddress,clock => mainClock);
	instruction_memory: InstructionMemory port map (AddressIM => ReadAddress,Instruction => Instruction);									   

end architecture;