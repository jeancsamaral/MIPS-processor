library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2x1_32bits is 
    port(
        ctrl: in std_logic;
        A, B: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
    );
end mux_2x1_32bits;

architecture beh of mux_2x1_32bits is 
begin 
    S <= A when ctrl="0" else B;
end beh;