library IEEE;
use IEEE.std_logic_1164.all;

entity sign_extend is
    port(
        Din: in std_logic_vector(15 downto 0);
        Dout: out std_logic_vector(31 downto 0);
    )
end sign_extend;

architecture beh of sign_extend is 
begin
    Dout<= x"0000"&Din when (Din(15)='0') else x"ffff"&Din;

end beh;
