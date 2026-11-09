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

// ----------------------------------------------------------------------------
// 3. BEHAVIORAL MODELING
// Uses a procedural 'always @(*)' block that executes whenever input A changes.
// -----------------------------------------------------------------------------
module not_gate_behavioral (
    input  wire A;
    output reg  Y     // Declared as a 'reg' because it is assigned inside an always block
);
    
    always @(*) begin
        if (A == 1'b0)
            Y = 1'b1;
        else if (A == 1'b1)
            Y = 1'b0;
        else
            Y = 1'bx;   // Handles unknown/hign-impedance states
    end
endmodule

// ============================================================================
// TESTBENCH (For Simulation & Verification)
// Applies stimulus (0 and 1) to the NOT gate and prints/dumps waveform results.
// ============================================================================
module tb_not_gate;
    reg  A_tb;   // 'reg' drives the input from an initial block
    wire Y_tb;   // 'wire' captures the output from the Unit Under Test (UUT)

    // Instantiate the Dataflow NOT gate as the Unit Under Test
    not_gate_dataflow UUT (
        .A(A_tb),
        .Y(Y_tb)
    );

    initial begin
        // Optional waveform dump for Icarus Verilog / GTKWave
        $dumpfile("not_gate.vcd");
        $dumpvars(0, tb_not_gate);

        // Print signal changes to console
        $monitor("Time = %0t ns | Input A = %b | Output Y = %b", $time, A_tb, Y_tb);

        // Test Case 1: Input 0 -> Expected Output 1
        A_tb = 1'b0;
        #10;

        // Test Case 2: Input 1 -> Expected Output 0
        A_tb = 1'b1;
        #10;

        // Return to 0 and finish simulation
        A_tb = 1'b0;
        #10;

        $finish;
    end
endmodule
