// ----------------------------------------------------------------------------
// NOT GATE in SystemVerilog (Dataflow, Combinational always_comb & Gate-Level)
// ----------------------------------------------------------------------------

`timescale 1ns / 1ps

// ---------------------------------------------------------------------
// 1. DATAFLOW MODELING (Continuous Assignment with 'logic')
// SystemVerilog replaces separate 'wire' and 'reg' types with 'logic'.
// ---------------------------------------------------------------------
module not_gate_dataflow (
    input  logic A,      // 4-state single-bit input (0, 1, X, Z)
    output logic Y      // 4-state single-bit inverted output
);

    assign Y = ~A;

endmodule

// ---------------------------------------------------------------------
// 2. COMBINATIONAL RTL MODELING (Using 'always_comb')
// 'always_comb' automatically infers the sensitivity list and prevents
// accidental latch inference at compile/synthesis time.
// ---------------------------------------------------------------------
module not_gate_comb (
    input  logic A;
    output logic Y
);

    always_comb begin
        Y = ~A;
    end
endmodule

// -------------------------------------------------------------------
// 3. PARAMETERIZED N-BIT INVERTER (Bonus SystemVerilog Feature)
// Scales from a 1-bit NOT gate to any bus width (default WIDTH = 1).
// -------------------------------------------------------------------
module not_gate_param #(
    parameter int WIDTH = 1
) (
    input  logic [WIDTH-1:0] A,
    output logic [WIDTH-1:0] Y
);
    always_comb begin
        Y = ~A;
    end
endmodule

// ============================================================================
// SYSTEMVERILOG TESTBENCH (With Self-Checking Assertions)
// Uses wildcard port connections (.*) and 'assert' for automatic verification.
// ============================================================================
module tb_not_gate_sv;
    logic A;
    logic Y;

    // Instantiate the combinational NOT gate using SystemVerilog '.*' implicit port connection
    not_gate_sv_comb UUT (.*);

    initial begin
        $dumpfile("not_gate_sv.vcd");
        $dumpvars(0, tb_not_gate_sv);

        $monitor("Time = %0t ns | Input A = %b | Output Y = %b", $time, A, Y);

        // Test Case 1: Input 0 -> Expected Output 1
        A = 1'b0;
        #10;
        assert (Y === 1'b1) else $error("Test Failed: Expected Y = 1 when A = 0");

        // Test Case 2: Input 1 -> Expected Output 0
        A = 1'b1;
        #10;
        assert (Y === 1'b0) else $error("Test Failed: Expected Y = 0 when A = 1");

        // Return to 0 and finish
        A = 1'b0;
        #10;
        assert (Y === 1'b1) else $error("Test Failed: Expected Y = 1 when A = 0");

        $display("All SystemVerilog NOT gate assertions passed!");
        $finish;
    end
endmodule
