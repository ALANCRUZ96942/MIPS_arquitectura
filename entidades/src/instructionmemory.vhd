-------------------------------------------------------------------------------
--
-- Title       : instructionmemory
-- Design      : instructionmemory
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\instructionmemory\instructionmemory\src\instructionmemory.vhd
-- Generated   : Mon Apr 18 23:38:52 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {instructionmemory} architecture {instructionmemory}}
	

	
	
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity InstructionMemory is
	 Generic (size: integer := 32);
    Port (
		AddressIM : in  STD_LOGIC_VECTOR(size-1 downto 0);
		Instruction : out STD_LOGIC_VECTOR (size-1 downto 0)
		);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type memoryType is array (0 to 9) of STD_LOGIC_VECTOR (31 downto 0);
signal memory : memoryType :=(	

X"8eb0000a",
X"12700005",
X"12700005",
X"0235a025",
X"02328820",
X"02959025",
X"027e9820",
X"aed20001",
X"08100001",
X"08100009"

)



;	
begin
	process(addressIM)
		begin
				if(conv_integer(addressIM(5 downto 0))<64)then
					Instruction <= memory(conv_integer(addressIM(5 downto 0)));
				else
					Instruction <= X"00000000";
				end if;
				--Instruction <= "00000000000000010001000000100000";
		end process;
end Behavioral;

