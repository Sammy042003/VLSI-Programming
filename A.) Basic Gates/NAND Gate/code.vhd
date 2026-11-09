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


