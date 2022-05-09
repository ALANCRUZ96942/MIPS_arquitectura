			

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity PC is
    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
	Output : out STD_LOGIC_VECTOR (31 downto 0));
end PC;


architecture Behavioral of PC is	   
	Signal add: STD_LOGIC_VECTOR (31 downto 0);
	
	begin
	   process (Input)
	    begin
	   	   	Output <= Input;
	
		end process;	 

end Behavioral;	

		
