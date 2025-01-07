library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end;

architecture tb of testbench is

    component xor4
        port(
            a: in STD_LOGIC_VECTOR(3 downto 0);
            y: out STD_LOGIC
        );
    end component;


    signal a: STD_LOGIC_VECTOR(3 downto 0) := "0000";  -- initial value
    signal y: STD_LOGIC;

begin
    DUT : xor4
        port map (
            a => a,
            y => y
        );

    process
    begin
        -- a = "0000" (Expect y = '0')
        a <= "0000";
        wait for 1 ns;
        assert(y='0') report "Test 1 Failed";

        
        -- a = "0001" (Expect y = '1')
        a <= "0001";
        wait for 1 ns;
        assert(y='1') report "Test 2 Failed";
        
        -- a = "0011" (Expect y = '0')
        a <= "0011";
        wait for 1 ns;
        assert(y='0') report "Test 3 Failed";
        
        -- a = "0111" (Expect y = '1')
        a <= "0111";
        wait for 1 ns;
        assert(y='1') report "Test 4 Failed";
        
        wait;
    end process;
end tb;
