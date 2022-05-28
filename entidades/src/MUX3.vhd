library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MUX3 is
	 Generic(size:integer := 32);
    Port (
		Data13, Data03: in  STD_LOGIC_VECTOR(size-1 downto 0);
		Selector: in STD_LOGIC;
		Result: out STD_LOGIC_VECTOR(size-1 downto 0));
end MUX3;

architecture Behavioral of MUX3 is
begin
	process(selector, Data03, Data13)
		begin
			case selector is
				when '0' => result <= Data03;
				when '1' => result <= Data13;
				when others => result <= Data13;
			end case;
	end process;
end Behavioral;