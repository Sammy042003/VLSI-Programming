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
