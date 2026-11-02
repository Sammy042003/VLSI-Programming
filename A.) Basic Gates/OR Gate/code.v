// ---------------------------------------------------------------------
//   OR Gate in VLSI (Dataflow, Gate-Level and Behavioral Architectures)
// ---------------------------------------------------------------------

`timescale 1ns / 1ps

// -------------------------------------------------------------------------------
// 1. DATAFLOW MODELING (Most common for combinational logic)
//    Uses the continuous assignment 'assign' keyword and bitwise OR operator '|'.
// -------------------------------------------------------------------------------

module or_gate (
    input  wire A,   // Input 1
    input  wire B,   // Input 2
    output wire Y    // Output (Y = A OR B)
);
  
    assign Y = A | B;
  
endmodule

// --------------------------------------------------------------------------
// 2. GATE-LEVEL / STRUCTURAL MODELING (Alternative using built-in primitive)
// Syntax: or <instance_name> (output, input1, input2);
// --------------------------------------------------------------------------

module or_gate_structural (
    input  wire A;
    input  wire B;
    output wire Y
);

    or u1 (Y, A, B);

endmodule

// ----------------------------------------------------------------------
// 3. BEHAVIORAL MODELING (Alternative using a procedural 'always' block)
// Note: Output inside an 'always' block must be declared as 'reg'.
// ----------------------------------------------------------------------

module or_gate_behavioral (
    input  wire A,
    input  wire B,
    output reg  Y
);

    always @(A or B) begin
        if (A == 1'b1 || B == 1'b1)
            Y = 1'b1;
        else
            Y = 1'b0;
    end
endmodule

// ====================================================================
// TESTBENCH (For simulation in Icarus Verilog, Vivado, ModelSim, etc.)
// Tests all four input combinations: 00, 01, 10, 11
// ====================================================================

module or_gate_tb;
    // Testbench signals: 'reg' for inputs we drive, 'wire' for outputs we monitor
    reg  A_tb;
    reg  B_tb;
    wire Y_tb;

    // Instantiate the Unit Under Test (UUT)
    or_gate uut (
        .A(A_tb),
        .B(B_tb),
        .Y(Y_tb)
    );

    initial begin
        // Print header and monitor signal changes in console
        $display("Time\t A B | Y");
        $monitor("%0t\t %b %b | %b", $time, A_tb, B_tb, Y_tb);

        // Apply all 4 input combinations (10 ns apart)
        A_tb = 1'b0; B_tb = 1'b0; #10;
        A_tb = 1'b0; B_tb = 1'b1; #10;
        A_tb = 1'b1; B_tb = 1'b0; #10;
        A_tb = 1'b1; B_tb = 1'b1; #10;

        $finish; // End simulation
    end
endmodule


    
