----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:31:23 01/08/2020 
-- Design Name: 
-- Module Name:    test_8bits_fulladder_mod - Behavioral 
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

entity test_8bits_fulladder_mod is
	port( x, y : in std_logic_vector(7 downto 0);
			z    : in std_logic;
			sum  : out std_logic_vector(7 downto 0);
			carry : out std_logic);
end test_8bits_fulladder_mod;

architecture Behavioral of test_8bits_fulladder_mod is
	signal s1 : std_logic;
	component test_4bits_mod
		port(x, y : in std_logic_vector(3 downto 0);
			z   : in std_logic;
			sum : out std_logic_vector(3 downto 0);
			carry : out std_logic);
	end component;
	
begin
	gate1 : test_4bits_mod	port map(x(3 downto 0),y(3 downto 0), z, sum(3 downto 0), s1);
	gate2 : test_4bits_mod	port map(x(7 downto 4),y(7 downto 4), s1, sum(7 downto 4), carry);

end Behavioral;

