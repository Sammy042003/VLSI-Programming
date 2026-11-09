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

-- --------------------------------------------------------------------
-- 2. Behavioral Architecture (Alternative style using a process block)
--    Evaluates sequentially whenever input A or B changes.
-- --------------------------------------------------------------------
architecture Behavioral of half_adder is
begin
    process(A, B)
    begin
        if (A = '1' and B = '1') then
            Sum   <= '0';
            Carry <= '1';
        elsif (A = '1' or B = '1') then
            Sum   <= '1';
            Carry <= '0';
        else
            Sum   <= '0';
            Carry <= '0';
        end if;
    end process;
end Behavioral;
    
-- ==============================================================
-- Testbench: Verifies all 4 input combinations (00, 01, 10, 11)
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_half_adder is
-- A testbench has no external ports
end tb_half_adder;

architecture sim of tb_half_adder is
    -- Signals to wire up to the Unit Under Test (UUT)
    signal A_tb     : STD_LOGIC := '0';
    signal B_tb     : STD_LOGIC := '0';
    signal Sum_tb   : STD_LOGIC;
    signal Carry_tb : STD_LOGIC;
begin
    -- Instantiate the Dataflow Half Adder
    UUT: entity work.half_adder(Dataflow)
        port map (
            A     => A_tb,
            B     => B_tb,
            Sum   => Sum_tb,
            Carry => Carry_tb
        );

    -- Stimulus process: cycles through all 4 truth-table rows
    stim_proc: process
    begin
        -- Case 1: 0 + 0 = 0 (Sum = 0, Carry = 0)
        A_tb <= '0'; B_tb <= '0';
        wait for 10 ns;
        assert (Sum_tb = '0' and Carry_tb = '0')
            report "Test failed for A=0, B=0" severity error;

        -- Case 2: 0 + 1 = 1 (Sum = 1, Carry = 0)
        A_tb <= '0'; B_tb <= '1';
        wait for 10 ns;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test failed for A=0, B=1" severity error;

        -- Case 3: 1 + 0 = 1 (Sum = 1, Carry = 0)
        A_tb <= '1'; B_tb <= '0';
        wait for 10 ns;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test failed for A=1, B=0" severity error;

        -- Case 4: 1 + 1 = 2 (Binary 10 -> Sum = 0, Carry = 1)
        A_tb <= '1'; B_tb <= '1';
        wait for 10 ns;
        assert (Sum_tb = '0' and Carry_tb = '1')
            report "Test failed for A=1, B=1" severity error;

        report "All Half Adder test cases passed!" severity note;
        wait; -- Stops the simulation cleanly
    end process;
end sim;
