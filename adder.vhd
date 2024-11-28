-- Implementation of adder using a comportamental approach

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity adder is
	port (
		A,B: in std_logic_vector(31 downto 0); -- Inputs of our adder (32 bits inputs)
		S: out std_logic_vector(31 downto 0) -- The output of the adder, also 32 bits
	);
end entity;

architecture beh of adder is
begin
		S <= A+B;
end beh;

