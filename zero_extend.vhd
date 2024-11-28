library IEEE;
use IEEE.std_logic_1164.all;

entity zero_extend is 
    port(
        inic: in std_logic;
        extend: out std_logic_vector(31 downto 0);
    )
end zero_extend;

architecture beh of zero_extend is 
begin
    extend<=x"0000000"&"000"&inic;

end beh;