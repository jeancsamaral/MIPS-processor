library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity registers is
    port(
        clk, we3: in std_logic;
        A1, A2, A3: in std_logic_vector(4 downto 0);
        WD3: in std_logic_vector(31 downto 0);
        RD1, RD2: out std_logic_vector(31 downto 0);
    )
end entity;
architecture beh of registers is
    type ram_type is array(0 to 31) of std_logic_vector(31 to 0);
    signal ram : ram_type;
    begin
        process(clk)
        begin
            if(clk'event and clk='1') then
                if(we3='1') then
                    ram(conv_integer(A3))<=WD3;
                end if;
            end if;
        end process;

        process(A1, A2)
        begin
            if( conv_integer(A1)=0) then RD1<=x"00000000";
		    else RD1<=ram(conv_integer(A1));
		    end if;

		    if(conv_integer(A2)=0) then RD2<=x"00000000";
		    else RD2<=ram(conv_integer(A2));
		    end if;
        end process;

end beh;
