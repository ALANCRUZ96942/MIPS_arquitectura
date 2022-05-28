library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MUX1 is
	 Generic(size:integer := 32);
    Port (
		Data01, Data11: in  STD_LOGIC_VECTOR(size-1 downto 0);
		Selector: in STD_LOGIC;
		Result: out STD_LOGIC_VECTOR(4 downto 0));
end MUX1;

architecture Behavioral of MUX1 is
begin
	process(selector, data01(20 downto 16), data11(15 downto 11))
		begin
			case selector is
				when '0' => Result <= data01(20 downto 16);
				when '1' => Result <= data11(15 downto 11);
				when others => Result <= data01(20 downto 16);
			end case;
	end process;
end Behavioral;