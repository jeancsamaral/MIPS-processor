library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_subtractor is
    port (
        ctrl: in std_logic;
        A, B: in std_logic_vector (31 downto 0);
        S: out std_logic_vector (31 downto 0);
        Cout: out std_logic
    );
end entity;

architecture beh of adder_subtractor is 
signal result: std_logic_vector(32 downto 0);
begin
    result<=("0" & A) + ("0" & B) + ctrl;
    S<=result(31 downto 0);
    Cout<=result(32);
end beh;