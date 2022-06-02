library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;  
--use ieee.numeric_std.all; -- Needed for shifts

entity PC_SECTION1 is
	Generic(size:integer := 32);
    Port (  
		Branch, Zero, Jump: in STD_LOGIC; 	--Control signals (Boolean)
		SignExtend, Instruction: in STD_LOGIC_VECTOR (size-1 downto 0); --From sign extend (32 bits)
		NextAddress: out  STD_LOGIC_VECTOR(size-1 downto 0);   				--from PC Output  (32 bits)
		ReadAddress: in  STD_LOGIC_VECTOR(size-1 downto 0)					-- form PC Input (32 bits) actual address
	);
end PC_SECTION1;


architecture Behavioral of PC_SECTION1 is		
signal Inst_Shift1: STD_LOGIC_VECTOR (27 downto 0);			--To save Shifted  value	
signal SignExt_Shift: STD_LOGIC_VECTOR (size-1 downto 0); 	--To save Shifted  value		
signal BEQ: STD_LOGIC; 										--Branch on equal
signal Add_1: STD_LOGIC_VECTOR (size-1 downto 0); 			--To save Add1_module value (32 bits) / ADDR Normal op. (pc+4)
 
begin
	process(Branch, Zero, Jump, SignExtend, Instruction, ReadAddress,Add_1,SignExt_Shift,Inst_Shift1) 
		begin
			
			BEQ <= Branch and Zero; -- Branch AND zero to determine BEQ
			Add_1 <= ReadAddress + 1;		-- Add1 (Normal operation) -- en verdad es mas 1?

			if(Jump = '1') then  --MUX_PC_1	
				Inst_Shift1 <=  "00" & Instruction (25 downto 0); --& "00"; --Shift Instruc (25-0) => (27-0);
				NextAddress <= Add_1 (31 downto 28) & (Inst_Shift1);--==========================  Calc address to JUMP 
			else 
				if (BEQ = '0') then --MUX_PC_2 
					NextAddress <= Add_1; --======================================================  Calc NORMAL operation next address (PC+4)
				else 
					SignExt_Shift <= SignExtend; --(29 downto 0) & "00";
					NextAddress <= Add_1 + SignExt_Shift; --======================================  Calc BEQ address
				end if;
			end if;
	end process;
	
end Behavioral;