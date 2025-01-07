-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity xor4 is
    port(
        a: in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input vector
        y: out STD_LOGIC                     -- single-bit output
    );
    
end xor4;

architecture synth of xor4 is
begin
    y <= (((a(3) xor a(2)) xor a(1)) xor a(0));
end synth;
