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

-- ---------------------------------------------------------------------
-- 2. ALTERNATIVE ARCHITECTURE (Behavioral Modeling)
-- Uses a process block that triggers whenever input 'A' changes state.
-- ---------------------------------------------------------------------
architecture Behavioral of not_gate is
begin
    process(A)
    begin
        if (A = '0') then
            Y <= '1';
        elsif (A = '1') then
            Y <= '0';
        else
            Y <= 'X';     -- Handles unknown/uninitializes logic states
        end if;
    end process;
end Behavioral;

-- =====================================================================
-- TESTBENCH (For Simulation & Verification)
-- Applies stimulus ('0' and '1') to the NOT gate to verify its output.
-- =====================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_not_gate is
-- A testbench entity has no input or output ports
end tb_not_gate;

architecture sim of tb_not_gate is
    -- Signals to the connect to the Unit Under Test (UUT)
    Signal A_tb : STD_LOGIC := '0';
    Signal B_tb : STD_LOGIC;
begin
