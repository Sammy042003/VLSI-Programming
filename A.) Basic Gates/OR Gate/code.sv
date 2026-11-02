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

