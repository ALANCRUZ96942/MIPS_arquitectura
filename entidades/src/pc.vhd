			

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity PC is
    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
	Output : out STD_LOGIC_VECTOR (31 downto 0);  
	RESET_N,clock : in STD_logic);	

end PC;


architecture Behavioral of PC is	  

  signal pc_actual: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
				  
	begin
	
		process(RESET_N, clock)
		begin				   
			
			 if (RESET_N = '1') then
			   
			    if rising_edge(clock) then
			      pc_actual  <=   "00000000000000000000000000000000";
			    end if;	
				
				
			elsif(falling_edge(clock))then
				pc_actual <= Input;
			end if;
		end process;  
		
		

		
		
		Output <= pc_actual;		
end Behavioral;	

		
