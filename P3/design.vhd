library IEEE;
use IEEE.std_logic_1164.all;

entity trafficController is
	port(
    	clk, reset : in STD_LOGIC;
    	tA, tB : in STD_LOGIC;
        lightsA, lightsB : out STD_LOGIC_VECTOR(1 downto 0)
    );  
end trafficController;


architecture synth of trafficController is
	type statetype is (S0, S1, S2, S3);
    type lightColor is (green, yellow, red);
    
    signal state, nextstate: statetype;
    
begin

	process (clk, reset)
    begin
    	if reset = '1' then
        	state <= S0;
        elsif clk'event and clk = '1' then 
        	state <= nextstate;
        end if;
    end process;
    
    process (state, tA, tB)
    begin
      if (state = S0 and tA = '1') then
          nextstate <= S0;
      elsif (state = S3) then
          nextstate <= S0;
          
      elsif (state = S0 and tA = '0') then
          nextstate <= S1;
          
      elsif (state = S1) then
          nextstate <= S2;
      elsif (state = S2 and tB = '1') then
          nextstate <= S2;
          
      elsif (state = S2 and tB = '0') then
          nextstate <= S3;
          
      else
          nextstate <= state;
      end if;
    end process;
    
    lightsA(1) <= '1' when (state = S3 or state = S2)
    				else '0';
    lightsA(0) <= '1' when (state = S1)
    				else '0';
    lightsB(1) <= '1' when (state = S0 or state = S1)
    				else '0';
    lightsB(0) <= '1' when (state = S3)
    				else '0';

end synth;