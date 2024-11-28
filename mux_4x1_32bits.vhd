library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4x1_32bits is 
    port(
        ctrl: in std_logic_vector(1 downto 0);
        A, B, C, D: in std_logic_vector(31 downto 0);
        S: out std_logic_vector(31 downto 0);
    );
end mux_4x1_32bits;

architecture beh of mux_4x1_32bits is 
begin 
    S <= A when (ctrl="00") else
         B when (ctrl="01") else
         C when (ctrl="10") else
         D;
end beh;