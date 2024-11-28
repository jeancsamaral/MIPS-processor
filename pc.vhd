library IEEE;
use iEEE.std_logic_1164.all;

entity pc is
    port(
        clk, reset: in std_logic;
        Din: in std_logic_vector(31 downto 0);
        Dout: out std_logic_vector(31 downto 0);
    )
end entity;

architecture beh of pc is
    begin
        process(clk,reset)
        begin
            if(reset='1') then
                Dout<=(others=>'0');
            elsif(clk'event and clk='1') then
                Dout<=Din;
            end if;
        end process;

end beh;
