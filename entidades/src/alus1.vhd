-------------------------------------------------------------------------------
--
-- Title       : ALUS1
-- Design      : ALUS1
-- Author      : Emmanuel Ramirez
-- Company     : Instituto Tecnologicoy  de Estudios Superiores de Monterrey
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ALUS1\ALUS1\src\ALUS1.vhd
-- Generated   : Mon Apr 18 17:17:00 2022
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
--{entity {ALUS1} architecture {ALUS1}}

library ieee;
use iEEE.std_logic_1164.all;
use iEEE.std_logic_arith.all;
use iEEE.std_logic_unsigned.all;

entity ALUS1 is	
port (
		a 			: in std_logic_vector (31 downto 0); --operador1
		b 			: in std_logic_vector (31 downto 0); --operador2
		operacion	: in std_logic_vector (2 downto 0); --selector
		result 		: out std_logic_vector (31 downto 0); --resultado
		carry_out	: out std_logic;
		cero 		: out std_logic 
	 );	
	
end ALUS1;



architecture ALUS1 of ALUS1 is
begin

process(a, b, operacion)
	begin
		case operacion is
			when "000" => result <= a and b; --AND
			when "001" => result <= a or b; --OR
			when "010" => result <= a nor b; --NOR
			when "011" => result <= a + b; --Addition
			when "100" => result <= a - b; --subtraction
			when others => NULL;
		end case;
end process;
		

end ALUS1;





