-- --------------------------------------------------------
-- AND GATE in VHDL (DataFlow and Behavioral Architectures)
-- --------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is 
  Port(
     A : in STD_LOGIC;    -- First input pin 
     B : IN STD_LOGIC;    -- Second input pin
     Y : out STD_LOGIC    -- Potput pin (Y = A AND B) 
  );
end and_gate;

-- ---------------------------------------------------------------------
-- 1. By DataFlow Architecture (Recommended for simple logic gates)
--    Uses concurrent signal assignment with the built-in 'and' operator
-- ---------------------------------------------------------------------

architecture Dataflow of and_gate is
begin
    Y <= A and B;
end Dataflow;

-- -----------------------------------------------------------------------
-- 2. Behavioral Architecture (Alternative approach using a process block)
--    Evaluates sequentially whenever input A and B changes.
-- -----------------------------------------------------------------------

architecture Behavioral of and_gate is
begin
    process(A, B)
    begin 
        if (A = '1' and B = '1') then
            Y <= '1';
        else
            Y <= '0';
        end if;
    end process;
end Behavioral;
  
  
