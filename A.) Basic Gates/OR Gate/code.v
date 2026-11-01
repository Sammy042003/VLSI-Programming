// ---------------------------------------------------------------------
//   OR Gate in VLSI (Dataflow, Gate-Level and Behavioral Architectures)
// ---------------------------------------------------------------------

`timescale 1ns / 1ps

// ------------------------------------------------------------------------------
// 1. DATAFLOW MODELING (Most common for combinational logic)
//    Uses the continuous assignment 'assign' keyword and bitwise OR operator '|'.
// ------------------------------------------------------------------------------

module or_gate (
    input  wire A,   // Input 1
    input  wire B,   // Input 2
    output wire Y    // Output (Y = A OR B)
);
  
    assign Y = A | B;
  
endmodule

// ---------------------------------------------------------------------------
// 2. GATE-LEVEL / STRUCTURAL MODELING (Alternative using built-in primitive)
// Syntax: or <instance_name> (output, input1, input2);
// ---------------------------------------------------------------------------

module or_gate_structural (
    input  wire A;
    input  wire B;
    output wire Y
);

    or u1 (Y, A, B);

endmodule

// ------------------------------------------------------------------------
// 3. BEHAVIORAL MODELING (Alternative using a procedural 'always' block)
// Note: Output inside an 'always' block must be declared as 'reg'.
// ------------------------------------------------------------------------
