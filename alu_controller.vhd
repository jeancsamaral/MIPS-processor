library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_controller is
    port (
        ALUOp: in std_logic_vector(1 downto 0);
        Funct: in std_logic_vector(5 downto 0);
        ALUControl: out std_logic_vector(2 downto 0)
    );
end alu_controller;

architecture beh of alu_controller is
begin
    process(ALUOp, Funct)
    begin
        case ALUOp is
            when "00" => ALUControl <= "010";  -- ADD (for lw/sw/addi)
            when "01" => ALUControl <= "110";  -- SUB (for beq)
            when "10" => 
                case Funct is
                    when "100000" => ALUControl <= "010"; -- ADD
                    when "100010" => ALUControl <= "110"; -- SUB
                    when "100100" => ALUControl <= "000"; -- AND
                    when "100101" => ALUControl <= "001"; -- OR
                    when "101010" => ALUControl <= "111"; -- SLT
                    when others   => ALUControl <= "---";
                end case;
            when others => ALUControl <= "---";
        end case;
    end process;
end beh; 