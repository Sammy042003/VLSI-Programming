-- =======================================================
-- OR GATE in VHDL (DataFlow and Behavioral Architectures)
-- =======================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is 
    Port (
        A : in  STD_LOGIC;      -- Input 1
        B : in  STD_LOGIC;      -- Input 2
        Y : out STD_LOGIC       -- Output (Y = A OR B)
    );
end or_gate;

-- --------------------------------------------------------------------
-- 1. DATAFLOW ARCHITECTURE (Recommended for basic logic gates)
-- Uses a concurrent signal assignment with the built-in 'or' operator.
-- --------------------------------------------------------------------

architecture Dataflow of or_gate is
begin

    Y <= A or B;

end Dataflow;

-- -----------------------------------------------------------------------
-- 2. BEHAVIORAL ARCHITECTURE (Alternative approach using a process block)
-- Evaluates whenever input A or B changes (sensitivity list).
-- -----------------------------------------------------------------------

architecture Behavioral of or_gate is
begin
    process(A, B)
    begin
        if (A = '1' or B = '1') then
            Y <= '1';
        else 
            Y <= '0';
        end if;
    end process;
end Behavioral;

-- ==========================================================================
-- 3. TESTBENCH (For simulation in ModelSim, Vivado, GHDL, or EDA Playground)
-- Tests all four input combinations: 00, 01, 10, 11
-- ==========================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate_tb is
-- A testbench has no external ports
end or_gate_tb;

architecture sim of or_gate_tb is
    -- Signals to connect to the Unit Under Test (UUT)
    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Y_tb : STD_LOGIC;
begin
    -- Instantiate the OR gate (using the Dataflow architecture)
    uut: entity work.or_gate(Dataflow)
        port map (
            A => A_tb,
            B => B_tb,
            Y => Y_tb
        );

    -- Stimulus process to drive test inputs
    stim_proc: process
    begin
        -- Case 1: 0 OR 0 = 0
        A_tb <= '0'; B_tb <= '0';
        wait for 10 ns;

        -- Case 2: 0 OR 1 = 1
        A_tb <= '0'; B_tb <= '1';
        wait for 10 ns;

        -- Case 3: 1 OR 0 = 1
        A_tb <= '1'; B_tb <= '0';
        wait for 10 ns;

        -- Case 4: 1 OR 1 = 1
        A_tb <= '1'; B_tb <= '1';
        wait for 10 ns;

        wait; -- Stop simulation
    end process;
end sim;
