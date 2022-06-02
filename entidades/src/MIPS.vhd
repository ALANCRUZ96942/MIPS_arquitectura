			library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MIPS is		 

	--ELEMENTOS DE MIPS	
Generic (size: integer := 32);
	Port (
	mainClock,Reset: in std_logic);
	--led: out std_logic);  
end MIPS;

architecture structural of MIPS is 	  

----------------------------------------------------------------------------------	

--partes de program counter	 
component PC is
    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
	Output : out STD_LOGIC_VECTOR (31 downto 0);  
	RESET_N, clock : in STD_logic);	

end component;

component PC_SECTION1 is
	Generic(size:integer := 32);
    Port (  
		Branch, Zero, Jump: in STD_LOGIC; 	--Control signals (Boolean)
		SignExtend, Instruction: in STD_LOGIC_VECTOR (size-1 downto 0); --From sign extend (32 bits)
		NextAddress: out  STD_LOGIC_VECTOR(size-1 downto 0);   				--from PC Output  (32 bits)
		ReadAddress: in  STD_LOGIC_VECTOR(size-1 downto 0)				-- form PC Input (32 bits) actual address
		);
end component;




--elementos de control
	component Control is
	  Port ( Instruction :  in STD_LOGIC_VECTOR (31 downto 0);
		RegDst: out std_logic;
		Jump: out std_logic;
		Branch:	 out std_logic;
		MemRead: out std_logic;
		MemtoReg:  out std_logic;
		ALUOp:	out std_logic_vector(1 downto 0); 
		MemWrite:	out std_logic;
		ALUSrc:  out  std_logic;
		RegWrite:  out	 std_logic
			  );
	end component;
	
	component ALU_control is
    Port ( Instruction :  in STD_LOGIC_VECTOR (31 downto 0);
			ALUOp:	in std_logic_vector(1 downto 0); 
			operacion	: out std_logic_vector (3 downto 0)
		  );
	end component ;
	
	--elementos combinacionales

	component InstructionMemory is
		Generic (size: integer := 32);
    	Port (
		AddressIM : in  STD_LOGIC_VECTOR(size-1 downto 0);
		Instruction : out STD_LOGIC_VECTOR (size-1 downto 0)
		);
	end component;	 
	

	component MUX1 is
		 Generic(size:integer := 32);
	    Port (
			Data01, Data11: in  STD_LOGIC_VECTOR(size-1 downto 0);
			Selector: in STD_LOGIC;
			Result: out STD_LOGIC_VECTOR(4 downto 0));
	end component;

	component MUX2 is
		 Generic(size:integer := 32);
	    Port (
			Data0, Data1: in  STD_LOGIC_VECTOR(size-1 downto 0);
			Selector: in STD_LOGIC;
			Result: out STD_LOGIC_VECTOR(size-1 downto 0));
	end component;
	
	component MUX3 is
	 Generic(size:integer := 32);
    Port (
		Data13, Data03: in  STD_LOGIC_VECTOR(size-1 downto 0);
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
	
	component Seu is
    Port ( Instruction :  in STD_LOGIC_VECTOR (31 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
	end component;	
	
	component datamemory is
	 Generic (size: integer := 32);
    Port (
		Address : in  STD_LOGIC_VECTOR(size-1 downto 0);
		WriteData : in STD_LOGIC_VECTOR (size-1 downto 0);
		MemoryWrite, MemoryRead, Clock : in STD_LOGIC;
		ReadData: out STD_LOGIC_VECTOR(size-1 downto 0));
	end component;
	
	component ALU is
	port (
			a 			: in std_logic_vector (31 downto 0); --operador1
			b 			: in std_logic_vector (31 downto 0); --operador2
			operacion	: in std_logic_vector (3 downto 0); --selector
			result 		: out std_logic_vector (31 downto 0); --resultado
			cero 		: out std_logic 
		 );
	end component;
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	
	--señales de registros
    signal Instruction: std_logic_vector(31 downto 0);
	signal write_register: std_logic_vector(4 downto 0);
	signal ReadData2: std_logic_vector (31 downto 0);
	signal writeData: STD_logic_vector(31 downto 0);
	
	
	--señales de control	
	signal	RegDst: std_logic;
	signal Jump: std_logic;
	signal Branch:	 std_logic;
	signal MemRead: std_logic;
	signal MemtoReg:  std_logic;
	signal ALUOp: std_logic_vector(1 downto 0); 
	signal MemWrite: std_logic;
	signal ALUSrc: std_logic;
	signal RegWrite:std_logic;
	
	signal operacion: std_logic_vector (3 downto 0); 	
	
	--señales de pc
	signal ShiftLeft: std_logic_vector (31 downto 0); 
	signal ReadAddress: std_logic_vector (31 downto 0); 
	signal NextAddress: std_logic_vector (31 downto 0); 

	
	
	
	--señales de ALU
    signal ALU_a: std_logic_vector (31 downto 0);
	signal ALU_b: std_logic_vector (31 downto 0);
    signal ALU_result: std_logic_vector (31 downto 0);
	signal ALU_zero: std_logic;
	
	signal read_data_mem: std_logic_vector (31 downto 0);
	
begin 

	--componentes de control
	control_gral: Control port map (Instruction => Instruction, RegDst => RegDst,Jump => Jump,Branch => Branch,MemRead => MemRead,MemtoReg => MemtoReg,ALUOp => ALUOp,MemWrite => MemWrite,ALUSrc => ALUSrc,RegWrite => RegWrite);  
	alu_control_main: ALU_control  port map (Instruction => Instruction, ALUOp => ALUOp,operacion => operacion);
	

	instruction_memory: InstructionMemory port map (AddressIM => ReadAddress,Instruction => Instruction);	
	
	mux_01: MUX1 port map(Data01 => Instruction ,Data11 => Instruction,Selector => RegDst, Result => write_register);
	mux_02: MUX2 port map(Data0 => ReadData2 ,Data1 => ShiftLeft,Selector => ALUSrc, Result => ALU_b);
	mux_03: MUX3 port map(Data03 => ALU_result ,Data13 => read_data_mem,Selector => MemtoReg, Result => writeData);
	
	register_01: Registers port map (ReadADR1 => Instruction, ReadADR2 => Instruction, WriteADR1 => write_register, WriteReadSEL  => RegWrite,clock => mainClock ,DataIn1 => writeData,DataOut1 => ALU_a,DataOut2 => ReadData2);	  
	extended_sign: seu port map (Instruction => Instruction, Output => ShiftLeft); 
										
	memory: datamemory port map (Address => ALU_result ,WriteData => ReadData2,MemoryWrite => MemWrite,MemoryRead => MemRead,Clock => mainClock, ReadData => read_data_mem);
	
	nube_pc: PC_SECTION1 port map(Branch  => Branch, Zero  => ALU_zero, Jump  => Jump,SignExtend  => ShiftLeft, Instruction  => Instruction,NextAddress  =>  NextAddress  ,ReadAddress => ReadAddress);
	program_counter:  PC port map(Input => NextAddress,Output => ReadAddress,clock => mainClock,RESET_N => Reset);
	
	main_alu: ALU port map(a => ALU_a,b => ALU_b,operacion => operacion ,result => ALU_result,cero => ALU_zero);
end architecture;