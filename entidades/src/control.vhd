				  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity Control is
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
end Control;


architecture Behavioral of Control is
	Signal Ins: STD_LOGIC_VECTOR (5 downto 0);
	begin
	   process (Instruction(31 downto 26))  
	    
	   begin	   
		      Ins <= Instruction(31 downto 26); 
	   		case Ins is
				
				when "000000" => 
				RegDst <= '1';
				ALUSrc <= '0';
				MemtoReg <= '0';
				RegWrite <= '1';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '0';
				ALUOp <= "10";
				Jump <= '0';

				when "100011" => 
				RegDst <= '0'; 
				ALUSrc <= '1';
				MemtoReg <= '1';
				RegWrite <= '1';
				MemRead <= '1';
				MemWrite <= '0';
				Branch <= '0';
				ALUOp <= "00";
				Jump <= '0';
			
				when "101011" => 
				RegDst <= '0';
				ALUSrc <= '1';
				MemtoReg <= '0';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '1';
				Branch <= '0';
				ALUOp <= "00";
				Jump <= '0';
				
				when "000100" => 
				RegDst <= '0';
				ALUSrc <= '0';
				MemtoReg <= '0';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '1';
				ALUOp <= "01";
				Jump <= '0';
			
				when others => 				
				RegDst <= '0';
				ALUSrc <= '0';
				MemtoReg <= '0';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '0';
				ALUOp <= "00";
				Jump <= '1';
				
			end case;
	   
	   
		end process;	 
end Behavioral;	

		








