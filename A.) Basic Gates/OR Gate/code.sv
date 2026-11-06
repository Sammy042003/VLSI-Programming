// ----------------------------------------------------------------------------
// OR GATE in SystemVerilog (Dataflow, Combinational always_comb & Gate-Level)
// ----------------------------------------------------------------------------

`timescale 1ns / 1ps

// ------------------------------------------------------------------
// 1. DATAFLOW MODELING (Using SystemVerilog 'logic' data type)
// 'logic' replaces both 'wire' and 'reg' for single-driver signals.
// ------------------------------------------------------------------

module or_gate (
    input  logic A,    // Input 1
    input  logic B,    // Input 2
    output logic Y     // Output  (Y = A | B)
);

    assign  Y = A | B;

endmodule

// ---------------------------------------------------------------------
// 2. BEHAVIORAL MODELING (Using SystemVerilog 'always_comb')
// 'always_comb' automatically infers the sensitivity list and prevents
// accidental latches during synthesis.
// ---------------------------------------------------------------------

module or_gate_comb (
    input  logic A,
    input  logic B,
    output logic Y
);

    always_comb begin
        if (A || B)
            Y = 1'b1;
        else
            Y = 1'b0;
    end
    
endmodule

// ---------------------------------------------------------------
// 3. GATE-LEVEL MODELING (Built-in primitive with 'logic' ports)
// ---------------------------------------------------------------

module or_gate_structural (
    input  logic A,
    input  logic B,
    output logic Y
);

    or u1 (Y, A, B);

endmodule

// ============================================================================
// SELF-CHECKING TESTBENCH
// Uses 'logic' signals, wildcard port connections (.*), and assertions.
// ============================================================================
module or_gate_tb;
    // 'logic' works for both driven testbench inputs and monitored outputs
    logic A;
    logic B;
    logic Y;

    // Instantiate the Unit Under Test (UUT) using '.*' wildcard port connection
    or_gate uut (.*);

    initial begin
        $display("Time (ns) | A  B | Y");
        $monitor("%0t\t  | %b  %b | %b", $time, A, B, Y);

        // Step through all 4 input combinations (00, 01, 10, 11)
        for (int i = 0; i < 4; i++) begin
            {A, B} = 2'(i);
            #10;
            // Self-checking immediate assertion
            assert (Y === (A | B))
                else $error("Mismatch at time %0t: A=%b, B=%b, Y=%b", $time, A, B, Y);
        end

        $display("Simulation complete: All 4 test cases passed.");
        $finish;
    end
endmodule
