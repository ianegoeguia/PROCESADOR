library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAM is 
	port (adress: in std_logic_vector (6 downto 0);
			clk,wr: in std_logic;
			data_in: in std_logic_vector (7 downto 0); 
			data_out: out std_logic_vector (7 downto 0));
end entity;

architecture func of RAM is 
	type mem_dato is array (0 to 95) of std_logic_vector (7 downto 0);
	signal RAM: mem_dato :=(
	--va desde 88,0 a DC
		x"00",x"00",x"00",x"00",--0x80
		x"00",x"00",x"00",x"00",--0x84
		x"00",x"00",x"00",x"00",--0x88
		x"00",x"00",x"00",x"00",--0x8C
		x"00",x"00",x"00",x"00",--0x90
		x"00",x"00",x"00",x"00",--0x94
		x"00",x"00",x"00",x"00",--0x98
		x"00",x"00",x"00",x"00",--0x9C
		x"00",x"00",x"00",x"00",--0xA0
		x"00",x"00",x"00",x"00",--0xA4
		x"00",x"00",x"00",x"00",--0xA8
		x"00",x"00",x"00",x"00",--0xAC
		x"00",x"00",x"00",x"00",--0xB0
		x"00",x"00",x"00",x"00",--0xB4
		x"00",x"00",x"00",x"00",--0xB8
		x"00",x"00",x"00",x"00",--0xBC
		x"00",x"00",x"00",x"00",--0xC0
		x"00",x"00",x"00",x"00",--0xC4
		x"00",x"00",x"00",x"00",--0xC8
		x"00",x"00",x"00",x"00",--0xCC
		x"00",x"00",x"00",x"00",--0xD0
		x"00",x"00",x"00",x"00",--0xD4
		x"00",x"00",x"00",x"00",--0xD8
		x"00",x"00",x"00",x"00"--0xDC
	);
	begin 
		process (clk)
			begin
			if(clk'event and clk='1') then 
				if (wr = '1') then 
					RAM(conv_integer(unsigned (adress))) <= data_in;
				end if;
			end if;
		end process;
	data_out <= RAM (conv_integer(unsigned(adress)));
end architecture;
