

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity Seu is
    Port ( Instruction :  in STD_LOGIC_VECTOR (31 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end Seu;


architecture Behavioral of Seu is	   
	Signal num: STD_LOGIC_VECTOR (31 downto 0);
	begin
	   process (Instruction)
	    begin
	     num(15 downto 0) <= Instruction(15 downto 0);
	
		 case Instruction (15) is
   	      	when '1' => num(31 downto 16)  <= "1111111111111111";
			when'0' => num(31 downto 16)  <= "0000000000000000";	  
			when others => num(31 downto 16)  <= "0000000000000000";     
		end case;		   	
		end process;	 
			Output <= num;
end Behavioral;	

		








