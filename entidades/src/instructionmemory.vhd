-------------------------------------------------------------------------------
--
-- Title       : instructionmemory
-- Design      : instructionmemory
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\instructionmemory\instructionmemory\src\instructionmemory.vhd
-- Generated   : Mon Apr 18 23:38:52 2022
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
--{entity {instructionmemory} architecture {instructionmemory}}
	

	
	
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity InstructionMemory is
	 Generic (size: integer := 32);
    Port (
		AddressIM : in  STD_LOGIC_VECTOR(size-1 downto 0);
		Instruction : out STD_LOGIC_VECTOR (size-1 downto 0)
		);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type memoryType is array (0 to 51) of STD_LOGIC_VECTOR (31 downto 0);
signal memory : memoryType :=(
"00000000000000010001000000100000", -- ADD de $s0 y $s1, se guarda en $s2 
"00000000100000110010100000100010", -- SUB de $s4 y $s3, se guarda en $s5 
"00000000110001110100000000100100", -- AND de $s6 y $s7, se guarda en $s8
"00000001001010100101100000100101", -- OR de $s9 y $s10, se guarda en $s11
"10001110010100110000000000000001", -- LW Dirección de memoria de datos (Registro 18+1), se guarda en $s19
"10101110101101100000000000000001", -- SW Dirección de memoria de datos (Registro 21+1), se guarda en la memoria de datos en el valor de 22
"00010000010001010000000000000010", -- BEQ si $s2 == $s5 hace un salto de 3, si no, seguirá a la siguiente instrucción
"10101000000000000000000000000010", -- JUMP salto de 2 direcciones
"00000001001000110010100000100000", -- ADD de $s9 y $s3, se guarda en $s5
"00000000100010010001000000100000", -- ADD de $s4 y $s9, se guarda en $s2
"00000010000001000010100000100010",	-- SUB de $s16 y $s4, se guarda en $s5
"00000010101100110100000000100100", -- AND de $s21 y $s19, se guarda en $s8 
"00000001111000010101100000100101", -- OR de $s15 y $s1, se guarda en $s11 
"10001100110100110000000000000011", -- LW Dirección de memoria de datos (Registro 6+3), se guarda en $s19
"10101101111101100000000000000010", -- SW Dirección de memoria de datos (Registro 15+2), se guarda en la memoria de datos en el valor de 22
"00010000011100000000000000000101", -- BEQ si $s2 == $s16 hace un salto de 5, si no, seguirá a la siguiente instrucción
"10101000000000000000000000000010", -- JUMP salto de 2 direcciones 
"00000010000110011000100000100000", -- ADD de $s16 y $s25, se guarda en $s17 
"00000010100111010001000000100000", -- ADD de $s20 y $s29, se guarda en $s2
"00000010010011110010100000100010", -- SUB de $s18 y $s16, se guarda en $s5
"00000011000110010100000000100100", -- AND de $s24 y $s25, se guarda en $s8
"00000001100011010101100000100101",	-- OR de $s12 y $s13, se guarda en $s11
"10001101010100110000000000000100", -- LW Dirección de memoria de datos (Registro 10+4), se guarda en $s19
"10101111000101100000000000000100", -- SW Dirección de memoria de datos (Registro 24+4), se guarda en la memoria de datos en el valor de 22
"00010001100011100000000000000010", -- BEQ si $s12 == $s14 hace un salto de 2, si no, seguirá a la siguiente instrucción
"10101000000000000000000000000100", -- JUMP salto de 4 direcciones 
"00000001010110110100000000100000", -- ADD de $s10 y $s27, se guarda en $s8 
"00000001111110010001000000100000", -- ADD de $s15 y $s51, se guarda en $s2
"00000010000001100010100000100010", -- SUB de $s16 y $s6, se guarda en $s5
"00000000000010010100000000100100", -- AND de $s0 y $s9, se guarda en $s8 
"00000010100110110101100000100101", -- OR de $s20 y $s27, se guarda en $s11
"10001101010100110000000000000111", -- LW Dirección de memoria de datos (Registro 6+7), se guarda en $s19 
"10101111111101100000000000000111", -- SW Dirección de memoria de datos (Registro 31+7), se guarda en la memoria de datos en el valor de 19
"00010000111100000000000000000011", -- BEQ si $s5 == $s16 hace un salto de 3, si no, seguirá a la siguiente instrucción 
"10101000000000000000000000000110", -- JUMP salto de 6 direcciones
"00000000000111010111000000100000", -- ADD de $s0 y $s29, se guarda en $s14 
"00000001101001100001000000100000", -- ADD de $s15 y $s6, se guarda en $s2
"00000001101000010010100000100010", -- SUB de $s15 y $s1, se guarda en $s2
"00000001001111000100000000100100", -- AND de $s9 y $s28, se guarda en $s8
"00000001100010010101100000100101",	-- OR de $s12 y $s9, se guarda en $s11
"10001110010100110000000000000101",	-- LW Dirección de memoria de datos (Registro 18+5), se guarda en $s19
"10101110111101100000000000000101", -- SW Dirección de memoria de datos (Registro 23+5), se guarda en la memoria de datos en el valor de 22
"00010000100000000000000000000111", -- BEQ si $s4 == $s0 hace un salto de 7, si no, seguirá a la siguiente instrucción 
"00000010100100000001000000100000", -- ADD de $s20 y $s16, se guarda en $s2
"00000011001000110010100000100010", -- SUB de $s15 y $s51 se guarda en $s2
"00000000001001110100000000100100",	-- AND de $s1 y $s7, se guarda en $s8
"00000011010110110101100000100101", -- OR de $s26 y $s27, se guarda en $s11
"10001100111100110000000000001000", -- LW Dirección de memoria de datos (Registro 7+8), se guarda en $s19
"10101111110101100000000000001000",	-- SW Dirección de memoria de datos (Registro 30+8), se guarda en la memoria de datos en el valor de 22
"00010001100100000000000000000100", -- BEQ si $s12 == $s16 hace un salto de 4, si no, seguirá a la siguiente instrucción
"00000011111111010001000000100000", -- ADD de $s31 y $s29, se guarda en $s2
"00000011001001000010100000100010"); -- SUB de $s25 y $s4 se guarda en $s5		
begin
	process(addressIM)
		begin
				if(conv_integer(addressIM(5 downto 0))<64)then
					Instruction <= memory(conv_integer(addressIM(5 downto 0)));
				else
					Instruction <= X"00000000";
				end if;
				--Instruction <= "00000000000000010001000000100000";
		end process;
end Behavioral;

