--Ian Eguia Ocampo 
--A01745598
--ALU implementada con bit slice

library ieee;
use ieee.std_logic_1164.all;

entity ALUbitSlice is 
	port(Cin,NA,NB: in std_logic;
	     A,B: in std_logic_vector(7 downto 0);
		  control: in std_logic_vector(5 downto 0);
		  S:out std_logic_vector (7 downto 0);
		  C: out std_logic);
end entity;

architecture func of ALUbitSlice is 

	component ALU is
		port(A,B,Cin: in std_logic;
			  control:in std_logic_vector(5 downto 0);
			  C,S:out std_logic);
	end component;
	
	component Co2ALU is
		port (A: in std_logic_vector(7 downto 0);
          comp: out std_logic_vector(7 downto 0));
	end component;
	
	signal C0,C1,C2,C3,C4,C5,C6,C7: std_logic;
	signal compA,compB,AS,BS:std_logic_vector (7 downto 0);
	
	begin
		I0:Co2ALU port map (A,compA);
		I1:Co2ALU port map (B,compB);
		with NA select
			AS<= compA when '1',
				 A when '0',
				 null when others;
				 
		with NB select 
			BS<= compB when '1',
			    B when '0',
				 null when others;
		I2: ALU port map (AS(0),BS(0),Cin,control,S(0),C0);
		I3: ALU port map (AS(1),BS(1),C0,control,S(1),C1);
		I4: ALU port map (AS(2),BS(2),C1,control,S(2),C2);
		I5: ALU port map (AS(3),BS(3),C2,control,S(3),C3);
		I6: ALU port map (AS(4),BS(4),C3,control,S(4),C4);
		I7: ALU port map (AS(5),BS(5),C4,control,S(5),C5);
		I8: ALU port map (AS(6),BS(6),C5,control,S(6),C6);
		I9: ALU port map (AS(7),BS(7),C6,control,S(7),C);

	
end architecture;