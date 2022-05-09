

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;	

entity pc_adder is
    Port ( Input :  in STD_LOGIC_VECTOR (31 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end pc_adder;


architecture Behavioral of pc_adder is	   
	
	begin
	   process (Input)
	    begin

		   Output <= Input + 4;
	
		end process;
end Behavioral;	
