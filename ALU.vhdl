library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
port( A, B: in std_logic_vector(7 downto 0);  --Inputs
      sel:  in  std_logic_vector(7 downto 0); --Selection Bus
      O:    out std_logic_vector(7 downto 0); --Output
      C:    out std_logic); --Carry Bit
end alu;

architecture behavior of alu is
  --Add Signals
      signal output:    std_logic_vector(8 downto 0);  --Including carry bit
begin
      
      O <= output(7 downto 0);
      C <= output(8);

      process(sel, A, B)
      begin
            if sel(7)='0' then      --Arithmatic Operations
                  case sel(6 downto 0) is
                        when "000_0000" => output <= std_logic_vector(unsigned(A) + unsigned(B));
                        when "000_0001" => output <= std_logic_vector(unsigned(A) - unsigned(B));
                        when "000_0010" => output <= std_logic_vector(unsigned(B) - unsigned(A));
                        when "000_0011" => output <= std_logic_vector(unsigned(A) - unsigned(B));
                        when "000_0100" => output <= A sra 1; -- Check syn
                        when "000_0101" => output <= A sla 1; -- Check syn
                        when "000_0110" => output <= B sra 1; -- Check syn
                        when "000_0111" => output <= B sla 1; -- Check syn
                        --Add More
                  end case;
            else                    --Logic Operations
                  case sel(6 downto 0) is
                        when "000_0000" => output <= not A;
                        when "000_0001" => output <= not B;
                        when "000_0010" => output <= A and B;
                        when "000_0011" => output <= A or B;
                        when "000_0100" => output <= A xor B;
                        when "000_0101" => output <= A nand B;
                        when "000_0110" => output <= A nor B;
                        when "000_0111" => output <= not A;
                        when "000_1000" => output <= A srl 1;
                        when "000_1001" => output <= A sll 1;
                        when "000_1010" => output <= B srl 1;
                        when "000_1011" => output <= B sll 1;
                        --Add More
                  end case;
            end if;
      end process;
  
end behavior;
