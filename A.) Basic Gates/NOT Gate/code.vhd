-- --------------------------------------------------------
-- NOT GATE in VHDL (DataFlow and Behavioral Architectures)
-- --------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port ( A : in  STD_LOGIC;      -- Single-bit logic input
           Y : out STD_LOGIC       -- Single-bit inverted logic output
    );
end not_gate;

-- ---------------------------------------------------------------------------
-- 1. ARCHITECTURE (Dataflow Modeling - Most Common & Recommended)
-- Uses the concurrent signal assignment operator (<=) and the 'not' keyword.
-- ---------------------------------------------------------------------------

architecture Dataflow of not_gate is
begin

    -- Concurrent assignment: Y continuously takes the inverted value of A
    Y <= not A;

end Dataflow;

