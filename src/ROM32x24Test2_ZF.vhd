----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:05 12/29/2020 
-- Design Name: 
-- Module Name:    ROM32x24 - Behavioral 
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
											  --  LOOP:	
								x"808101", --0    mov 0x1020, w1 ;INW0=ffff
								x"808112", --1    mov 0x1022, w2 ;INW1=0001
								x"408182", --2    add w1,w2,w3   ;0000, Z=1  
								x"410382", --3    add w2,w2,w7   ;0002, Z=0
								x"510202", --4    sub w2,w2,w4   ;0000, Z=1  
								x"520202", --5    sub w4,w2,w4   ;FFFF, Z=0  
								x"608283", --6    and w1,w3,w5   ;0000, Z=1
								x"608281", --7    and w1,w1,w5   ;FFFF Z=0
								x"718303", --8    ior w3,w3,w6   ;0000 Z=1
								x"708302", --9    ior w1,w2,w6   ;FFFF Z=0
								x"888121", --10   mov w1, 0x1024
								x"888122", --11   mov w2, 0x1024
								x"888123", --12   mov w3, 0x1024
								x"888124", --13   mov w4, 0x1024
								x"888125", --14   mov w5, 0x1024
								x"888126", --15   mov w6, 0x1024
								x"37FFEF", --16   bra LOOP
								x"000000", --17
								x"000000", --18
								x"000000", --19
								x"000000", --20
								x"000000", --21
								x"000000", --22
								x"000000", --23
								x"000000", --24
								x"000000", --25
								x"000000", --26
								x"000000", --27
								x"000000", --28
								x"000000", --29
								x"000000", --30
								x"000000" --31
								);
begin

Data <= ROM(conv_integer(Addr));

end ROM32x24_arch;

