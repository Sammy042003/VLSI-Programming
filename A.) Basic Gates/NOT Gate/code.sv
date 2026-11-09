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

