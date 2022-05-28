-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ALU21\ALU\src\ALU.vhd
-- Generated   : Mon May  9 14:03:34 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library ieee;
use iEEE.std_logic_1164.all;
use iEEE.std_logic_arith.all;
use iEEE.std_logic_unsigned.all;

entity ALU is
port (
		a 			: in std_logic_vector (31 downto 0); --operador1
		b 			: in std_logic_vector (31 downto 0); --operador2
		operacion	: in std_logic_vector (3 downto 0); --selector
		result 		: out std_logic_vector (31 downto 0); --resultado
		cero 		: out std_logic 
	 );
end ALU;

--}} End of automatically maintained section

architecture ALU1 of ALU is		 
Signal result_in: STD_LOGIC_VECTOR (31 downto 0); 

begin		   
	
	process(a, b, operacion,result_in) 		
	begin			   
			
		
		case operacion is
			when "0000" => result_in <= a and b; --AND	
			when "0001" => result_in <= a or b; --OR
			when "0010" => result_in <= a + b; --ADD
			when "0110" => result_in <= a - b; --SUBTRACTION
			when "0111" => if(a>b) then
				result_in <= "00000000000000000000000000000001";
			else
				result_in <= "00000000000000000000000000000000";	
			end if; --set on less than 
			when "1100" => result_in <= a nor b; 
			when others => NULL;
		end case;	 
					    
		
		if(result_in = "00000000000000000000000000000000") then
			cero  <= '1'; 
		else   
			cero  <= '0';
		end if;
		
		
		end process; 
					   
			result  <=  result_in ;
		
end ALU1;