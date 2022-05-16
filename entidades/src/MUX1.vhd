library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MUX1 is
	 Generic(size:integer := 32);
    Port (
		Data1, Data2: in  STD_LOGIC_VECTOR(size-1 downto 0);
		Selector: in STD_LOGIC;
		Result: out STD_LOGIC_VECTOR(size-1 downto 0));
end MUX1;

architecture Behavioral of MUX1 is
begin
	process(selector, data1(20 downto 16), data2(15 downto 11))
		begin
			case selector is
				when '0' => result <= data1;
				when '1' => result <= data2;
				when others => result <= data1;
			end case;
	end process;
end Behavioral;