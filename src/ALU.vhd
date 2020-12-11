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
			  C 		    : out STD_LOGIC;		-- Carry flag
			  N 		    : out STD_LOGIC;		-- Negate flag
			  OV 		    : out STD_LOGIC;		-- Overflow flag
			  Z 		 	 : out STD_LOGIC;		-- Zero flag
           Y 		 	 : out STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

	signal OPB 		  : STD_LOGIC_VECTOR (16 downto 0);
	signal OPS 		  : STD_LOGIC_VECTOR (16 downto 0); 
	signal result	  : STD_LOGIC_VECTOR(16 downto 0);
	signal overflow  : STD_LOGIC;
	signal tempBTG   : STD_LOGIC_VECTOR(15 downto 0);
	signal shiftVal  : STD_LOGIC_VECTOR(4 downto 0);
	signal temp_SUBB : STD_LOGIC_VECTOR(16 downto 0);
	signal tempZ     : STD_LOGIC;
	
begin

	OPB <= (b"0"&RdData1);
	OPS <= (b"0"&RdData2);
	
	tempBTG <= RdData2(15 downto (conv_integer(BTG_lit4) + 1)) & (not RdData2(conv_integer(BTG_lit4))) & RdData2((conv_integer(BTG_lit4) - 1) downto 0);
	shiftVal <= OPS(4 downto 0);
	temp_SUBB <= OPB - SUBB_lit5;
	
with ALUOP select
	result <= OPB + OPS when "000",																-- ADD Wb ,Ws, Wd
			    OPB - OPS when "001",																-- SUB Wb, Ws, Wd				 
				 OPB and OPS when "010",															-- AND Wb, Ws, Wd
				 OPB or OPS when "011",																-- IOR Wb, Ws, Wd
				 ((not OPS) + 1) when "100",  													-- NEG Ws, Wd
				 (x"0000"&b"0" + OPB(15 downto conv_integer(shiftVal))) when "101",  -- LSR Wb, Wns, Wnd
				 ('0'&tempBTG) when "110", 														-- BTG Ws, #bit4
				 (temp_SUBB - (not temp_SUBB(16))) when "111",								-- SUBB Wb, #lit5, Wd
				 x"0000"&b"0" when others;
				 
	Y <= result(15 downto 0);
		 
	C <= result(16) when (rising_edge(Clk) and C_EN = '1');	
	
	tempZ <= '1' when (result = x"0000") else 
		  '0';
		  
	Z <= tempZ when(rising_edge(Clk) and Z_EN = '1');
	
	
	overflow <= '1' when ((ALUOP = "000" and OPB(15) = OPS(15) and result(15) = (not OPB(15))) or		-- ADD Wb ,Ws, Wd
								 (ALUOP = "001" and OPB(15) = (not OPS(15)) and result(15) = OPS(15)) or		-- SUB Wb, Ws, Wd	
								 (ALUOP = "100" and OPS(15) = result(15)) or												-- NEG Ws, Wd
								 (ALUOP = "110" and OPB(15) = (not OPS(15)) and result(15) = OPS(15))) else	-- SUBB Wb, #lit5, Wd
					'0';
	
	OV <= overflow when (rising_edge(Clk) and OV_EN = '1');
	
	N  <= result(15) when (rising_edge(Clk) and N_EN = '1');

end Behavioral;