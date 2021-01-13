----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:52 11/27/2020 
-- Design Name: 
-- Module Name:    ROM32x24_Milestone2 - Behavioral 
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

entity ROM32x24 is
    Port ( 
			Addr : in  STD_LOGIC_VECTOR (4 downto 0);
			Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24;

architecture ROM32x24_arch of ROM32x24 is

-- The following code must appear before the "begin" keyword in the architecture
-- body.

    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
    constant ROM : tROM :=(
											  --	LOOP:
								x"808101", --  	mov     0x1020, w1  		 Moving the data from 0x1020 to W1
								x"808112", --  	mov     0x1022, w2    	 Moving the data from 0x1022 to W2
								x"5882E8", --  	subb    w1, #0x8, w5  	 N and C flags are active
								x"32FFFC", --  	bra     z, LOOP	       No jump since the active flags are only N and C
								x"330000", --  	bra	  n, Z_LOOP  		 Jump to Z_LOOP since the N flag is active
								              
											  -- 	Z_LOOP:
								x"A20001", --    	btg     w1, #0x0 							 
								x"EA0181", --     neg     w1, w3
								x"DE0A02", --     lsr     w1, w2, w4
								x"320000", --     bra	  z, MOVE_LOOP		 Jump to MOVE_LOOP since the Z flag is active 
								                
											  -- 	MOVE_LOOP:
								x"888121", -- 		mov     w1, 0x1024
								x"888122", --     mov     w2, 0x1024
								x"888123", --     mov     w3, 0x1024
								x"888124", --     mov     w4, 0x1024
								x"888125", --     mov     w5, 0x1024
								x"888126", --     mov     w6, 0x1024
								x"37FFF0", --     bra	    LOOP				 Jump to LOOP
								                
								
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000", --
								x"000000" --
								);
begin

	Data <= ROM(conv_integer(Addr));

end ROM32x24_arch;