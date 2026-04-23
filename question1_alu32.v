`timescale 1ns / 1ps

// Question 1
module alu32 (
    //first 32-bit operand
    input  wire [31:0] A,
    //second 32-bit operand
    input  wire [31:0] B,
    //3-bit control signal to select the ALU operation
    input  wire [2:0]  ALUCntrl,
    //this is 32-bit result of the ALU operation
    output reg  [31:0] result,
    //flag=1 if the result is 0
    output wire        Zero
);
    //combinational logic block 
    //updates whenever the inputs change
    always @(*) begin
        case (ALUCntrl)
            //bitwise AND
            3'b000: result = A & B;
            //bitwise OR
            3'b001: result = A | B;
            //addition
            3'b010: result = A + B;
            //subtraction
            3'b110: result = A - B;
            //set less than, signed
            3'b111: result = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            //default case to handle invalid ALUCntrl values
            default: result = 32'b0;
        endcase
    end

    //this is the zero flag logic
    //if result is all zeroes, set zero = 1, otherwise 0
    assign Zero = (result == 32'b0);
endmodule
