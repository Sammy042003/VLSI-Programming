// --------------------------------------------------------------------
// AND Gate in VLSI (Dataflow, Gate-Level and Behavioral Architectures)
// --------------------------------------------------------------------

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

module and_and_gate (
    input wire A,
    input wire B,
    input wire Y
);

    // Syntax : and <instance_name> (output, input1, input2)
    and u1(Y, A, B);
    
endmodule

// --------------------------------------------------------------------
// 3. Alternative: Behavioral Modeling (Uses procedural 'always' block)
// --------------------------------------------------------------------

module and_gate_behavioral (
    input wire A,
    input wire B,
    output reg Y       // Declared as 'reg' because it is assigned inside 'always'
);

    always @(*) begin
        if (A == 1'b1 && B == 1'b1)
            Y = 1'b1;
        else
            Y = 1'b0;
    end
endmodule

// ========================================================================
// 4. Testbench: Simulates all 4 binary input combinations (00, 01, 10, 11)
// ========================================================================

module and_gate_tb;

    // Testbench signals: 'reg' for driven inputs, 'wire' for observed output
    reg  A_tb;
    reg  B_tb;
    wire Y_tb;

    // InstantiTE THE Unit Under Test (UUT)
    and_gate UUT (
        .A(A_tb),
        
