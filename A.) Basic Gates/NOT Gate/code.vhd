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
    -- Signals to connect to the Unit Under Test (UUT)
    Signal A_tb : STD_LOGIC := '0';
    Signal B_tb : STD_LOGIC;
begin
    -- Instantiate the NOT gate (using the Dataflow architecture)
    UUT: entity work.not_gate(Dataflow)
        port map (
            A <= A_tb,
            Y <= Y_tb
        );

    -- Stimulus process to toggle input A
    stim_proc: process
    begin
        -- Test Case 1: Input '0' -> Expected Output '1'
        A_tb <= '0';
        wait for 10 ns;

        -- Test Case 2: Input '1' -> Expected Output '0'
        A_tb <= '1';
        wait for 10 ns;

        -- Return to '0' and finish
        A_tb <= '0';
        wait for 10 ns;

        wait;  -- Suspend simulation indefinitely
    end process;
end sim;
