// ---------------------------------------------------------------
// AND Gate in VLSI (Dataflow, Gate-Level and Behavioral Architectures)
// ---------------------------------------------------------------

`timescale 1ns / 1ps

// -----------------------------------------------------------------------------
// 1. 2-Input AND Gate Module (Dataflow Modeling - Recommended)
//    Uses continuous assignment ('assign') with the bitwise AND operator ('&').
// -----------------------------------------------------------------------------

module and_gate (
    input wire A,     // First input port
    input wire B,     // Second input port
    input wire Y      // Output port (Y = A & B )
);

    assign Y = A & B;
endmodule

// -------------------------------------------------------------------
// 2. Alternative: Gate-Level Modeling (Uses built-in 'and' primitive)
// -------------------------------------------------------------------

