library ieee;
use ieee.std_logic_1164.all;

entity alu is
port( A, B: in std_logic_vector(7 downto 0);  --Inputs
      sel:  in  std_logic_vector(7 downto 0); --Selection Bus
      O:    out std_logic_vector(7 downto 0); --Output
      C:    out std_logic); --Carry Bit
end alu;

architecture behavior of alu is
  --Add Signals
begin
  
end behavior;
