-- ----------------------------------------------------------
-- NAND GATE in VHDL (DataFlow and Behavioral Architectures)
-- ----------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    Port (
        A : in  STD_LOGIC;     -- First input pin
        B : in  STD_LOGIC;     -- Second input pin
        Y : out STD_LOGIC     -- Output pin: Y = NOT (A AND B)
    );
end nand_gate;

-- -----------------------------------------------------------------------
-- 1. Dataflow Architecture (Recommended for basic logic gates)
--    Uses concurrent signal assignment and the built-in 'nand' operator.
-- -----------------------------------------------------------------------
architecture Dataflow of nand_gate is
begin

    Y <= A nand B;

end Dataflow;

-- --------------------------------------------------------------------------------
-- 2. Alternative Behavioral Architecture
--    Describes circuit behavior using a sequential process and truth-table logic.
-- --------------------------------------------------------------------------------
architecture behavioral of nand_gate is
begin
    process(A, B)
    begin
        if (A = '1' and B = '1') then
            Y <= '0';
        else
            Y <= '1';
        end if
    end process;
end behavioral;

-- ============================================================
-- Self-Checking Testbench (Simulates all 4 input combinations)
-- ============================================================


