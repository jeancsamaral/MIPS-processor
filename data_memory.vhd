library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is
    port (
        clk, WE: in std_logic;
        A, WD: in std_logic_vector(31 downto 0);
        RD: out std_logic_vector(31 downto 0)
    );
end data_memory;

architecture beh of data_memory is
    type ram_type is array (0 to 63) of std_logic_vector(31 downto 0);
    signal ram: ram_type := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if WE = '1' then
                ram(to_integer(unsigned(A(7 downto 2)))) <= WD;
            end if;
        end if;
    end process;

    RD <= ram(to_integer(unsigned(A(7 downto 2))));
end beh; 