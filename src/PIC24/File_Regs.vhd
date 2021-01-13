----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:39 11/07/2020 
-- Design Name: 
-- Module Name:    File_Regs - Behavioral 
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

entity File_Regs is
    Port ( Clk     : in  STD_LOGIC;
           WrEn    : in  STD_LOGIC;
           RdRegB  : in  STD_LOGIC_VECTOR (3 downto 0);
           RdRegD  : in  STD_LOGIC_VECTOR (3 downto 0);
			  WrReg   : in  STD_LOGIC_VECTOR (3 downto 0);
           WrData  : in  STD_LOGIC_VECTOR (15 downto 0);
			  RdDataB : out STD_LOGIC_VECTOR (15 downto 0);
			  RdDataS : out STD_LOGIC_VECTOR (15 downto 0)
			  );
end File_Regs;

architecture Behavioral of File_Regs is
	type tRegs is array (0 to 15) of std_logic_vector(15 downto 0); 
	signal s16Regs16 : tRegs; 
	
begin

	s16Regs16(conv_integer(WrReg)) <= WRData when rising_edge(Clk) and WrEn = '1' ; 
	RdDataB <= s16Regs16 (conv_integer(RdRegB));
	RdDataS <= s16Regs16 (conv_integer(RdRegD));

end Behavioral;