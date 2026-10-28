// ----------------------------------------------------------------------------
// AND GATE in SystemVerilog (Dataflow, Combinational always_comb & Gate-Level)
// ----------------------------------------------------------------------------

`timescale 1ns / 1ps

// ---------------------------------------------------------------------
// 1. 2-Input AND Gate Module (Dataflow Modeling)
//    Uses SystemVerilog's unified 'logic' type and continuous 'assign'.
// ---------------------------------------------------------------------

module and_gate (
   input  logic A,     // First inout port
   input  logic B,     // Second input9 port 
   output logic Y     // Output port (Y = A & B)
);

   assign Y = A & B;
  
endmodule

// -------------------------------------------------------------------------
// 2. Alternative: Behavioral Combinational Modeling (Recommended RTL style)
//    Uses 'always_comb', which automatically builds the sensitivity list,
//    evaluates at time 0, and warns if a latch is accidentally inferred.
// -------------------------------------------------------------------------

module and_gate_behavioral (
   input  logic A,
   input  logic B,
   output logic Y      // Still 'logic' (no need to switch between 'wire' and 'reg')
);

  always_comb begin
      if (A && B)
          Y == '1';
      else
          Y == '0';
  end
endmodule

// -------------------------------------------------------------------
// 3. Alternative: Gate-Level Modeling (Uses built-in 'and' primitive)
// -------------------------------------------------------------------

module abd_gate_gate_level (
   input  logic A,
   input  logic B,
   output logic Y
);

  and u1 (Y, A, B);
  
endmodule
