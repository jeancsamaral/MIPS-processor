library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity instruction_memory is
    port(
        dir: in std_logic_vector(31 downto 0);
        instr: out std_logic_vector(31 downto 0);
    );
end entity;

architecture beh of instruction_memory is
    type mem is array(0 to 511) of std_logic_vector(7 downto 0)
    constant code : mem:=(
        -- Code is loaded here
    -- Example code: Calculate factorial of 5 (5!)
    -- # Initialize values
    -- addi $s1, $0, 5    # n = 5 (input number)
    -- addi $s2, $0, 1    # result = 1
    -- add  $s3, $s1, $0  # counter = n
    --
    -- loop:
    -- beq  $s3, $0, done # if counter == 0, exit
    -- mul  $s2, $s2, $s3 # result = result * counter
    -- addi $s3, $s3, -1  # counter--
    -- j    loop
    -- done:
    -- # Result (120) will be in $s2

        x"20",x"11",x"00",x"06",
		x"20",x"12",x"00",x"04",
		x"20",x"10",x"00",x"00",
		x"20",x"13",x"00",x"00",
		x"12",x"11",x"00",x"03",
		x"02",x"72",x"98",x"20",
		x"22",x"10",x"00",x"01",
		x"08",x"00",x"00",x"04",
    
    others=> x"00"
    );

    begin

        process(dir)
        begin
            instr(31 downto 24)<=code(conv_integer(dir));
            instr(23 downto 16)<=code(conv_integer(dir)+1);
            instr(15 downto 8)<= code(conv_integer(dir)+2);
            instr(7 downto 0)<=code(conv_integer(dir)+3);
        end process;
        
end beh;
