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

// ========================================================================
// 4. Testbench: Simulates all 4 binary input combinations (00, 01, 10, 11)
// ========================================================================

module and_gate_tb;
   // Unified 'logic' type works for both driven inputs and observed outputs
   logic A;
   logic B;
   logic Y;

   // Instantiate the Unit Under Test (UUT) using SystemVerilog wildcard (.*) port connection (automatically connects matching signal names A, B, Y))
   and_gate UUT (.*);

   // Stimulus block with native SystemVerilog immediate assertions
   initial begin
      $display("Starting SystemVerilog 2-Input AND Gate Simulation....");
      $monitor("Time = %0t ns | A = %b, B = %b | Y = %b", $time, A, B, Y);

      // Case 1: 0 AND 0 = 0
      A = '0; B = '0;
      #10;
      assert (Y === '0) else $error("Test failed for input 00");

      // Case 2: 0 AND 1 = 0
      A = '0; B = '1;
      #10;
      assert (Y === '0) else $error("Test failed for input 01");

      // Case 3: 1 AND 0 = 0
      A = '1; B = '0;
      #10;
      assert (Y === '0) else $error("Test failed for input 10");

      // Case 4: 1 AND 1 = 1
      A = '1; B = '1;
      #10;
      assert (Y === '1) else $error("Test failed for input 11");

      $display("All SystemVerilog AND gate test cases passed!");
      $finish; // Stop simulation
   end

endmodule
      
      
