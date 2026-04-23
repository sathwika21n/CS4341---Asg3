`timescale 1ns / 1ps
//defines the simulation time 
module question1_alu32_tb;
    //testbench signals
    //first ALU operand
    reg  [31:0] A;
    //second ALU operand
    reg  [31:0] B;
    //control signal to select ALU operation
    reg  [2:0]  ALUCntrl;
    //output result
    wire [31:0] result;
    //zero flag
    wire        Zero;

    //instantiate the ALU
    alu32 dut (
        .A(A),
        .B(B),
        .ALUCntrl(ALUCntrl),
        .result(result),
        .Zero(Zero)
    );

    //initial block runs once at the start of the simulation
    initial begin
        $display("Question 1: Testing alu32...");

        //AND operation
        A = 32'h0000000f; B = 32'h00000033; ALUCntrl = 3'b000; #1;
        $display("AND: A=%h B=%h result=%h Zero=%b", A, B, result, Zero);
        if (result !== 32'h00000003) $display("ALU AND failed");
        
        //OR operation
        ALUCntrl = 3'b001; #1;
        $display("OR:  A=%h B=%h result=%h Zero=%b", A, B, result, Zero);
        if (result !== 32'h0000003f) $display("ALU OR failed");

        //ADD operation
        A = 32'd10; B = 32'd15; ALUCntrl = 3'b010; #1;
        $display("ADD: A=%0d B=%0d result=%0d Zero=%b", A, B, result, Zero);
        if (result !== 32'd25) $display("ALU ADD failed");

        //SUB operation
        A = 32'd10; B = 32'd10; ALUCntrl = 3'b110; #1;
        $display("SUB: A=%0d B=%0d result=%0d Zero=%b", A, B, result, Zero);
        if (result !== 32'd0 || Zero !== 1'b1) $display("ALU SUB/Zero failed");

        //SLT operation
        A = -32'sd4; B = 32'sd3; ALUCntrl = 3'b111; #1;
        $display("SLT: A=%0d B=%0d result=%0d Zero=%b", $signed(A), $signed(B), result, Zero);
        if (result !== 32'd1) $display("ALU SLT failed");

        $display("Question 1 test finished.");
        $finish;
    end
endmodule
