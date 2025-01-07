library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.ALL; use STD.TEXTIO.all;

entity testbench is
end;

architecture tb of testbench is
	component xor4
      port(
          a: in STD_LOGIC_VECTOR(3 downto 0);
          y: out STD_LOGIC;
      );
    end;
    
    signal a: STD_LOGIC_VECTOR(3 downto 0);
    signal y: STD_LOGIC;
    
begin
	DUT : xor4 port map(a, y);
    
    process
    
    	file test_file: TEXT open READ_MODE is "test_vectors.txt";
    	variable line_buf: LINE;
    	variable input_bits: STD_LOGIC_VECTOR(3 downto 0);
    	variable expected_output: STD_LOGIC;
    	variable actual_output: STD_LOGIC;
        
    begin
    	while not endfile(test_file) loop
            
        	readline(test_file, line_buf); --read line from file
            read(line_buf, input_bits); --store first value to input
            read(line_buf, expected_output); --store second value expected output
            
            a <= input_bits;
            wait for 1 ns;
            
            actual_output := y;
            assert(actual_output = expected_output) report "Test failed for input " & std_logic_vector'image(input_bits) 
            severity failure;
            
        end loop;
        wait;
     end process;
end tb;
            