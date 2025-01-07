library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity;

architecture tb of testbench is 

  component trafficController is
      port(clk, reset : in STD_LOGIC;
          tA, tB : in STD_LOGIC;
          lightsA, lightsB : out STD_LOGIC_VECTOR(1 downto 0));
  end component;
  
  signal clk, reset, tA, tB : STD_LOGIC := '0';
  signal lightsA, lightsB : STD_LOGIC_VECTOR := "00";
  
begin 
	DUT : trafficController port map (
    	clk => clk, 
        reset => reset, 
        tA => tA, 
        tB => tB, 
        lightsA => lightsA, 
        lightsB => lightsB
    ); 
    
    clk_process: process
    begin
    	while now < 120 ns loop
        	CLK <= not clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;
    
    test_process: process
   	begin
    	-- reset system
    	
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
		wait for 10 ns;
        
        --simulate inputs

        tA <= '1'; tB <= '0';
        wait for 20 ns;
        
        tA <= '0'; tB <= '1';
        wait for 20 ns;
        
        tA <= '1'; tB <= '1';
        wait for 20 ns;
        
        tA <= '0'; tB <= '0';
        wait for 20 ns;
        
        tA <= '0'; tB <= '1';
        wait for 20 ns;
        
        wait;
    end process;  
end architecture;