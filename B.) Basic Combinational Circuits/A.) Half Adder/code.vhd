-- =============================================================================================================== 
-- 1-bit Half Adder in VHDL (Dataflow & Behavioral Architectures) along with a self-checking simulation Testbench.
-- =============================================================================================================== 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port (
        A     : in  STD_LOGIC;  -- First 1-bit binary input
        B     : in  STD_LOGIC;  -- Second 1-bit binary input
        Sum   : out STD_LOGIC;  -- 1-bit Sum output (A XOR B)
        Carry : out STD_LOGIC   -- 1-bit Carry-out output (A AND B)
    );
end half_adder;

-- -------------------------------------------------------------------------
-- 1. Dataflow Architecture (Recommended for simple combinational logic)
--    Uses concurrent signal assignments directly mapping Boolean equations.
-- -------------------------------------------------------------------------
architecture Dataflow of half_adder is
begin

    Sum   <= A XOR B;
    Carry <= A AND B;

end Dataflow;
              
