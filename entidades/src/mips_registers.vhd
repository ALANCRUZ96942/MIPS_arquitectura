library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Registers is
	Generic(size:integer := 32);
    Port (
		ReadADR1, ReadADR2, WriteADR1: in  STD_LOGIC_VECTOR(4 downto 0); --Address inputs (5 bits)
		WriteReadSEL, clock : in STD_LOGIC; --Control signals: WriteReadSEL	= 0: writing disabled
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
	process(clock)
		begin
			if(rising_edge(clock))then
					if(WriteReadSEL = '1') then
						Bank(conv_integer(WriteADR1)) <= DataIn1; --Save DataIn in Writeaddress 
					end if;		
			end if;
	end process;
	DataOut1 <= Bank(conv_integer(ReadADR1));--Parallel	output
	DataOut2 <= Bank(conv_integer(ReadADR2));	
end Behavioral;
