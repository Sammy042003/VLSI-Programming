// --------------------------------------------------------------------
// NOT Gate in VLSI (Dataflow, Gate-Level and Behavioral Architectures)
// --------------------------------------------------------------------

`timescale 1ns / 1ps

// ------------------------------------------------------------------------------
// 1. DATAFLOW MODELING (Most Common & Recommended)
// Uses continuous assignment ('assign') and the bitwise negation operator ('~').
// ------------------------------------------------------------------------------
module not_gate_dataflow (
    input wire A,             // Single-bit logic input
    input wire Y              // Single-bit inverted logic output
);

    assign Y = ~A;

endmodule

// -------------------------------------------------------------------
// 2. GATE-LEVEL (STRUCTURAL) MODELING
// Uses Verilog's built-in 'not' gate primitive: not (output, input);
// -------------------------------------------------------------------
module not_gate_structural (
    input wire A;
    input wire Y
);

    not U1 (Y, A);

endmodule


