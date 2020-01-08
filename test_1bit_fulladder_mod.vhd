----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:09:13 01/08/2020 
-- Design Name: 
-- Module Name:    test_1bit_fulladder_mod - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_1bit_fulladder_mod is
	port( x, y, z : in std_logic;
			sum, carry : out std_logic);
end test_1bit_fulladder_mod;

architecture Behavioral of test_1bit_fulladder_mod is
	signal s : std_logic_vector(1 to 5);
	component test_xor_mod	port(a ,b : in std_logic;
											y	 : out std_logic);
	end component;
	
	component test_or_mod	port(a ,b : in std_logic;
											y	 : out std_logic);
	end component;
	
	component test_and_mod	port(a ,b : in std_logic;
											y	 : out std_logic);
	end component;
	
	component test_nand_mod	port(a ,b : in std_logic;
											y	 : out std_logic);
	end component;
begin
	
	g_xor1 : test_xor_mod port map(x, y, s(1));
	g_xor2 : test_xor_mod port map(s(1), z, sum);
	g_and1 : test_and_mod port map(x, y, s(2));
	g_and2 : test_and_mod port map(y, z, s(3));
	g_and3 : test_and_mod port map(z,x ,s(4));
	g_or1  : test_or_mod port map(s(2), s(3), s(5));
	g_or2  : test_or_mod port map(s(5), s(4),carry);

end Behavioral;

