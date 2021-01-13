----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:21 11/07/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Clk        : in  STD_LOGIC;		-- Clock
			  RdData1    : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData2    : in  STD_LOGIC_VECTOR (15 downto 0);
			  BTG_lit4   : in  STD_LOGIC_VECTOR (3 downto 0);
			  SUBB_lit5	 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ALUOP      : in  STD_LOGIC_VECTOR (2 downto 0);
			  C_EN 	 	 : in  STD_LOGIC;
			  N_EN 	 	 : in  STD_LOGIC;
			  OV_EN	 	 : in  STD_LOGIC;
			  Z_EN 	 	 : in  STD_LOGIC;
			  CarryIN    : in  STD_LOGIC;
			  C 		    : out STD_LOGIC;		-- Carry flag
			  N 		    : out STD_LOGIC;		-- Negate flag
			  OV 		    : out STD_LOGIC;		-- Overflow flag
			  Z 		 	 : out STD_LOGIC;		-- Zero flag
           Y 		 	 : out STD_LOGIC_VECTOR (15 downto 0)
			  );
end ALU;

architecture Behavioral of ALU is
 
	signal result	  : STD_LOGIC_VECTOR(16 downto 0);
	signal overflow  : STD_LOGIC;
	signal tempBTG   : STD_LOGIC_VECTOR(15 downto 0);
	signal shiftVal  : STD_LOGIC_VECTOR(4 downto 0);
	signal tempZ     : STD_LOGIC;
	signal tempLSR   : STD_LOGIC_VECTOR(16 downto 0);
	
begin

	tempBTG <= (not RdData2(conv_integer(BTG_lit4))) & RdData2(14 downto 0) when BTG_lit4 = "1111" else
					RdData2(15 downto 1) & (not RdData2(conv_integer(BTG_lit4))) when BTG_lit4 = "0000" else
					RdData2(15 downto (conv_integer(BTG_lit4) + 1)) & (not RdData2(conv_integer(BTG_lit4))) & RdData2((conv_integer(BTG_lit4) - 1) downto 0);
					
	tempLSR <= x"0000"&b"0" when shiftVal(4) = '1' else
				  (x"0000"&b"0" + RdData1(15 downto conv_integer(shiftVal)));
	
	shiftVal <= RdData2(4 downto 0);

with ALUOP select
	result <= ((b"0"&RdData1) + (b"0"&RdData2)) when "000",														-- ADD Wb ,Ws, Wd
			    (('0'&RdData1) + ('0'&(not RdData2)) + 1) when "001",											-- SUB Wb, Ws, Wd				 
				 ((b"0"&RdData1) and (b"0"&RdData2)) when "010",													-- AND Wb, Ws, Wd
				 ((b"0"&RdData1) or (b"0"&RdData2)) when "011",														-- IOR Wb, Ws, Wd
				 (x"0000"&b"0" + (not RdData2) + 1) when "100",  													-- NEG Ws, Wd
				 tempLSR when "101", 																						-- LSR Wb, Wns, Wnd
				 ('0'&tempBTG) when "110", 																				-- BTG Ws, #bit4
				 ((b"0"&RdData1) + (b"1111_1111_111"&(not SUBB_lit5)) + 1 - (not CarryIN)) when "111",	-- SUBB Wb, #lit5, Wd
				 x"0000"&b"0" when others;
				 
	Y <= result(15 downto 0);
		 
	C <= result(16) when (rising_edge(Clk) and C_EN = '1');	
	
	tempZ <= '1' when (result(15 downto 0) = x"0000") else '0';
		  
	Z <= tempZ when(rising_edge(Clk) and Z_EN = '1');
	
	
	overflow <= '1' when ((ALUOP = "000" and RdData1(15) = RdData2(15) and result(15) = (not RdData1(15))) or		-- ADD Wb ,Ws, Wd
								 (ALUOP = "001" and RdData1(15) = (not RdData2(15)) and result(15) = RdData2(15)) or		-- SUB Wb, Ws, Wd	
								 (ALUOP = "100" and RdData2(15) = result(15)) or														-- NEG Ws, Wd
								 (ALUOP = "110" and RdData1(15) = (not RdData2(15)) and result(15) = RdData2(15))) else	-- SUBB Wb, #lit5, Wd
					'0';
	
	OV <= overflow when (rising_edge(Clk) and OV_EN = '1');
	
	N  <= result(15) when (rising_edge(Clk) and N_EN = '1');

end Behavioral;