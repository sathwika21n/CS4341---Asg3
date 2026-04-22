`timescale 1ns / 1ps

// Question 1
// 32-bit ALU matching the common Figure 5.15 MIPS-style ALU.
//
// ALUControl:
//   3'b000: AND
//   3'b001: OR
//   3'b010: ADD
//   3'b110: SUBTRACT
//   3'b111: SET LESS THAN, signed
//
// Zero is asserted when Result is 0.
module alu32 (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [2:0]  ALUControl,
    output reg  [31:0] Result,
    output wire        Zero
);
    always @(*) begin
        case (ALUControl)
            3'b000: Result = A & B;
            3'b001: Result = A | B;
            3'b010: Result = A + B;
            3'b110: Result = A - B;
            3'b111: Result = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            default: Result = 32'b0;
        endcase
    end

    assign Zero = (Result == 32'b0);
endmodule
