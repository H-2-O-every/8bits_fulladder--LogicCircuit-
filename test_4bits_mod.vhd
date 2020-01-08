----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:18:40 01/08/2020 
-- Design Name: 
-- Module Name:    test_4bits_mod - Behavioral 
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

entity test_4bits_mod is
	port(x, y : in std_logic_vector(3 downto 0);
			z   : in std_logic;
			sum : out std_logic_vector(3 downto 0);
			carry : out std_logic);
end test_4bits_mod;

architecture Behavioral of test_4bits_mod is
	signal s : std_logic_vector(0 to 2);
	component test_1bit_fulladder_mod
		port(x, y, z : in std_logic;
				sum, carry : out std_logic);
	end component;
	
begin
	gate1 : test_1bit_fulladder_mod	port map(x(0), y(0), z, sum(0), s(0));
	gate2 : test_1bit_fulladder_mod	port map(x(1), y(1), s(0), sum(1), s(1));
	gate3 : test_1bit_fulladder_mod	port map(x(2), y(2), s(1), sum(2), s(2));
	gate4 : test_1bit_fulladder_mod	port map(x(3), y(3), s(2), sum(3), carry);
end Behavioral;

