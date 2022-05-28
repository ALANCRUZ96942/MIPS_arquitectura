					 				  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity ALU_control is
    Port ( Instruction :  in STD_LOGIC_VECTOR (31 downto 0);
			ALUOp:	in std_logic_vector(1 downto 0); 
			operacion	: out std_logic_vector (3 downto 0)
		  );
end ALU_control;


architecture Behavioral of ALU_control is
	
	begin	
		
	   process (Instruction(5 downto 0),ALUOp)  
	   begin	   
		   
		   case ALUOp is		
			   
			   when "00" =>  operacion <= "0010";			   
			   when "01" =>  operacion <= "0110";
			   when "10" =>					   
			   
			   if(Instruction(5 downto 0) = "100000")then	
				   operacion <= "0010";
				elsif(Instruction(5 downto 0) = "100000")then	
				   operacion <= "0010";	 
				elsif(Instruction(5 downto 0) = "100010")then	
				   operacion <= "0110";
				elsif(Instruction(5 downto 0) = "100100")then	
				   operacion <= "0000";
				elsif(Instruction(5 downto 0) = "100101")then	
				   operacion <= "0001";
				elsif(Instruction(5 downto 0) = "101010")then	
				   operacion <= "0111";
				   
			   end if;
			
			   
			   when others => operacion <= "1111";			    
				
			end case;
		end process;	 
end Behavioral;	

		








