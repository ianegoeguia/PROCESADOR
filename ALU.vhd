--Ian Eguia Ocampo 
--a01745598
--ALU
library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(A,B,Cin: in std_logic;
		  control:in std_logic_vector(5 downto 0);
		  S,C:out std_logic);
end entity;

architecture func of ALU is 

	component HA is 
		port( A,B: in std_logic	;
				S, Co:out std_logic);
	end component; 
	
	
	signal Co0,S0,S1,Co1,Op:std_logic;
	signal ad: std_logic_vector(5 downto 1);
	
	begin 
		HA0: HA port map (A,B,S0,Co0);
		HA1: HA port map (S0,Cin,S1,Co1);
		Op<= A or B;
		C<= Co0 or Co1;
		ad<=control(5)&control(4)&control(3)&control(2)&control(1);
		
		--MUX con los operaciones de control
		with ad select
			S<= control(0) and S1 when "00110",
				control(1) and not (B) when "00101",
				control(2) and not (A) when "00100",
				control(3) and S0 when "00011",
				control(4) and Op when "00010",
				control(5) and Co0 when "00001",
				null when others;

		
--		--Inician los and con las unidades de control
--		ad(0)<= control(0) and S1;
--		ad(1)<= control(1) and not (B);
--		ad(2)<= control(2) and not (A);
--		ad(3)<= control(3) and S0;
--		ad(4)<= control(4) and Op;
--		ad(5)<= control(5) and Co0;
--		
end architecture;
	