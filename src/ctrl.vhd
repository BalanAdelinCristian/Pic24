----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:30 11/12/2020 
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( OP 		 : in std_logic_vector (4 downto 0);
			  ALUOP   : out std_logic_vector (2 downto 0);
           MemWr 	 : out std_logic;
           Mem2Reg : out std_logic;
           RegWr 	 : out std_logic;
           RegDest : out std_logic;
			  RegBase : out std_logic;
			  Branch  : out std_logic;
			  C_EN	 : out std_logic;
			  Z_EN	 : out std_logic;
			  OV_EN   : out std_logic;
			  N_EN    : out std_logic
			  );
end ctrl;

architecture Behavioral of ctrl is 

begin

	MemWr <= '1' when OP = b"1_0001" else '0'; 
	
	Mem2Reg <= '1' when OP = b"1_0000" else '0'; 
	
	RegWr <= '0' when OP = "10001" or OP = "00110" or OP = "10100" else '1'; 
	
	RegBase <= '0' when OP = "11011" else '1';
	
	RegDest <= '0' when OP = "10000" else '1'; 
	
			
	C_EN <= '1' when (OP = b"0_1000") or     -- ADD Wb, Ws, Wd
						  (OP = b"0_1010") or     -- SUB Wb, Ws, Wd
						  (OP = b"1_1101") or	  -- NEG Ws, Wd
						  (OP = b"0_1011") else   -- SUBB Wb, #lit5, Wd
				'0';
	
	Z_EN <= '1' when (OP = b"0_1000") or     -- ADD Wb, Ws, Wd
	                 (OP = b"0_1010") or     -- SUB Wb, Ws, Wd
	                 (OP = b"0_1100") or     -- AND Wb, Ws, Wd
	                 (OP = b"0_1110") or     -- IOR Wb, Ws, Wd
	                 (OP = b"1_1101") or     -- NEG Ws, Wd
	                 (OP = b"1_1011") or     -- LSR Wb, Ws, Wd
	                 (OP = b"0_1011") else   -- SUBB Wb, #lit5, Wd
			  '0';
			  
			  
	N_EN <= '1' when (OP = b"0_1000") or     -- ADD Wb, Ws, Wd
	                 (OP = b"0_1010") or     -- SUB Wb, Ws, Wd
	                 (OP = b"0_1100") or     -- AND Wb, Ws, Wd
	                 (OP = b"0_1110") or     -- IOR Wb, Ws, Wd
	                 (OP = b"1_1101") or     -- NEG Ws, Wd
	                 (OP = b"1_1011") or     -- LSR Wb, Ws, Wd
	                 (OP = b"0_1011") else   -- SUBB Wb, #lit5, Wd
			  '0';        

   OV_EN <= '1' when (OP = b"0_1000") or     -- ADD Wb, Ws, Wd
						   (OP = b"0_1010") or     -- SUB Wb, Ws, Wd
						   (OP = b"1_1101") or	   -- NEG Ws, Wd
						   (OP = b"0_1011") else   -- SUBB Wb, #lit5, Wd
			  '0';
	
			
	ALUOP <= "000" when OP = b"0_1000" else  -- ADD Wb, Ws, Wd
			   "001" when OP = b"0_1010" else  -- SUB Wb, Ws, Wd
			   "010" when OP = b"0_1100" else  -- AND Wb, Ws, Wd
			   "011" when OP = b"0_1110" else  -- IOR Wb, Ws, Wd
			   "100" when OP = b"1_1101" else  -- NEG Ws, Wd
				"101" when OP = b"1_1011" else  -- LSR Wb, Ws, Wd
				"110" when OP = b"1_0100" else  -- BTG Ws, #bit4
			   "111" when OP = b"0_1011";      -- SUBB Wb, #lit5, Wd
			
			
	Branch <= '1' when (OP = b"00110") else 
				 '0';
				 
end Behavioral;
