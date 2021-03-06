library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MUX2 is
	 Generic(size:integer := 32);
    Port (
		Data0, Data1: in  STD_LOGIC_VECTOR(size-1 downto 0);
		Selector: in STD_LOGIC;
		Result: out STD_LOGIC_VECTOR(size-1 downto 0));
end MUX2;

architecture Behavioral of MUX2 is
begin
	process(selector, data0, data1)
		begin
			case selector is
				when '0' => result <= data0;
				when '1' => result <= data1;
				when others => result <= data1;
			end case;
	end process;
end Behavioral;