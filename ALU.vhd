library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port (
        A, B: in std_logic_vector(31 downto 0);
        ALUControl: in std_logic_vector(2 downto 0);
        Zero: out std_logic;
        ALUResult: out std_logic_vector(31 downto 0)
    );
end ALU;

architecture beh of ALU is
    signal result: std_logic_vector(31 downto 0);
begin
    process(A, B, ALUControl)
    begin
        case ALUControl is
            when "000" => result <= A and B;                                    -- AND
            when "001" => result <= A or B;                                     -- OR
            when "010" => result <= std_logic_vector(signed(A) + signed(B));    -- ADD
            when "110" => result <= std_logic_vector(signed(A) - signed(B));    -- SUB
            when "111" => 
                if (signed(A) < signed(B)) then                                 -- SLT
                    result <= x"00000001";
                else
                    result <= x"00000000";
                end if;
            when others => result <= (others => '0');
        end case;
    end process;

    Zero <= '1' when result = x"00000000" else '0';
    ALUResult <= result;
end beh;

