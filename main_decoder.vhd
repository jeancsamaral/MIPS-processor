library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_decoder is
    port(
        opcode : in  STD_LOGIC_VECTOR(5 downto 0);
        RegWrite : out  STD_LOGIC;
        RegDst : out  STD_LOGIC;
        ALUSrc : out  STD_LOGIC;
        Branch : out  STD_LOGIC;
        MemWrite : out  STD_LOGIC;
        MemtoReg : out  STD_LOGIC;
        ALUOp : out  STD_LOGIC_VECTOR(1 downto 0);
        Jump : out  STD_LOGIC
        )
end entity;

architecture beh of main_decoder is
    signals controls: std_logic_vector(8 downto 0);
begin
process(opcode)
begin
    case opcode is
        when "000000" => controls <= "110000010";
		when "100011" => controls <= "101001000";
		when "101011" => controls <= "001010000";
		when "000100" => controls <= "000100001";
		when "001000" => controls <= "101000000";
		when "000010" => controls <= "000000100";
		when others   => controls <= "---------";
    end case;
    end process;

    regwrite	<=controls(8);
	regdst	<=controls(7);
	alusrc	<=controls(6);
	branch	<=controls(5);
	memwrite	<=controls(4);
	memtoreg	<=controls(3);
	jump		<=controls(2);
	aluop		<=controls(1 downto 0);

end beh;

