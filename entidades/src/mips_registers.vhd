library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Registers is						  
	Generic(size:integer := 32);
    Port (
	ReadADR1, ReadADR2: in  STD_LOGIC_VECTOR(size-1 downto 0); --Address inputs (5 bits)
	 WriteADR1 : IN STd_logic_vector(4 downto 0);
		WriteReadSEL,clock : in STD_LOGIC; --Control signals: WriteReadSEL	= 0: writing disabled
		DataIn1: in STD_LOGIC_VECTOR (size-1 downto 0); --Data Input to be saved (32 bits)
		DataOut1, DataOut2: out STD_LOGIC_VECTOR(size-1 downto 0)); --Data output (32 bits)
end Registers;


architecture Behavioral of Registers is		
type BankType is array(0 to 31) of std_logic_vector(31 downto 0);
signal bank: bankType := (
X"0000FFFF",X"000000A1",X"000000B2",X"000000C3",
X"000000D4",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000");	


begin
	process(clock,ReadADR1,ReadADR2,WriteReadSEL,DataIn1,WriteADR1)																				--ise 14.7
	begin
		if(rising_edge(clock))then									 --subida lectura	 
					DataOut1 <= Bank(conv_integer(ReadADR1(25 downto 21)));--Parallel	output
					DataOut2 <= Bank(conv_integer(ReadADR2(20 downto 16)));	
		
		end if;	
				
	end process;   
   
	
	process(clock,ReadADR1,ReadADR2,WriteReadSEL,DataIn1,WriteADR1)																				--ise 14.7
	begin
	  if (falling_edge(clock))	then		-- bajada escritura	
				 if(WriteReadSEL = '1') then
						Bank(conv_integer(WriteADR1)) <= DataIn1; --Save DataIn in Writeaddress 
				end if;	
		end if;
	end process;  
	
end Behavioral;
