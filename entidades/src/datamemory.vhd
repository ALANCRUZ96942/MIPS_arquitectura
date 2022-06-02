-------------------------------------------------------------------------------
--
-- Title       : datamemory
-- Design      : datamemory
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\datamemory\datamemory\src\datamemory.vhd
-- Generated   : Mon Apr 18 22:44:45 2022
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
--{entity {datamemory} architecture {datamemory}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity datamemory is
	 Generic (size: integer := 32);
    Port (
		Address : in  STD_LOGIC_VECTOR(size-1 downto 0);
		WriteData : in STD_LOGIC_VECTOR (size-1 downto 0);
		MemoryWrite, MemoryRead, Clock : in STD_LOGIC;
		ReadData: out STD_LOGIC_VECTOR(size-1 downto 0));
	    
end datamemory;

--}} End of automatically maintained section

architecture Behavioral of DataMemory is
type memoryType is array (0 to 63) of STD_LOGIC_VECTOR (31 downto 0);
signal memory : memoryType := (X"0000003F",
X"0000003E",
X"0000003D",
X"0000003C",
X"0000003B",
X"0000003A",
X"00000039",
X"00000038",
X"00000037",
X"00000036",
X"00000035",
X"00000034",
X"00000033",
X"00000032",
X"00000031",
X"00000030",
X"0000002F",
X"0000002E",
X"0000002D",
X"0000002C",
X"0000002B",
X"0000002A",
X"00000029",
X"00000028",
X"00000027",
X"00000026",
X"00000025",
X"00000024",
X"00000023",
X"00000022",
X"00000021",
X"00000020",
X"0000001F",
X"0000001E",
X"0000001D",
X"0000001C",
X"0000001B",
X"0000001A",
X"00000019",
X"00000018",
X"00000017",
X"00000016",
X"00000015",
X"00000014",
X"00000013",
X"00000012",
X"00000011",
X"00000010",
X"0000000F",
X"0000000E",
X"0000000D",
X"0000000C",
X"0000000B",
X"0000000A",
X"00000009",
X"00000008",
X"00000007",
X"00000006",
X"00000005",
X"00000004",
X"00000003",
X"00000002",
X"00000001",
X"00000000");
begin
	process(clock,MemoryRead,MemoryWrite,Address,WriteData)
		begin
	    if(rising_edge(clock))then	
				if(MemoryRead = '1')then
					ReadData <= memory(conv_integer(address(5 downto 0))); 	 
				end if;			
		elsif(falling_edge(clock))then		
				if (MemoryWrite = '1')then
					Memory(conv_integer(address(5 downto 0))) <= WriteData; 
				end if;
	    end if;
	end process;
end Behavioral;