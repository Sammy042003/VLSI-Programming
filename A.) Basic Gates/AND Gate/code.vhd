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
--    Evaluates sequentially whenever inputs A and B change.
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

-- -----------------------------------------------------------------
-- 3. Testbench: Simulates all 4 input combinations (00, 01, 10, 11)
--    (Self check testbench)
-- -----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is
-- A testbench has no external ports
end and_gate_tb;

architecture sim of and_gate_tb is
    -- Internal signals to connect to the Unit Under Test (UUT)
    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    SIGNAL y_tb : STD_LOGIC;
begin
    -- Instantiate the Dataflow architecture of and_gate
    UUT: entity work.and_gate(Dataflow)
        port map (
            A <= A_tb,
            B <= B_tb,
            Y <= Y_tb
        );

    -- Stimulus process to test every row of the truth table
    stim_proc: process
    begin
        -- Case 1: 0 AND 0 = 0
        A_tb <= '0'; B_tb <= '0';
        wait for 10 ns;
        assert (Y_tb = '0') report "Test failed for 00" severity error;

        -- Case 2: 0 AND 1 = 0
        A_tb <= '0'; B_tb <= '1';
        wait for 10 ns;
        assert (Y_tb = '0') report "Test failed for 01" severity error;

        -- Case 3: 1 AND 0 = 0
        A_tb <= '1'; B_tb <= '0';
        wait for 10 ns;
        assert (Y_tb = '0') report "Test failed for 10" severity error;

        -- Case 4: 1 AND 1 = 1
        A_tb <= '1'; B_tb <= '1';
        wait for 10 ns;
        assert (Y_tb = '1') report "Test failed for 11" severity error;

        report "ALL AND gate test cases passed!" severity note;
        wait; -- Stop simulation
    end process;
end sim;
  
