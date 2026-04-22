`timescale 1ns / 1ps

// Question 5
// Eight-input priority encoder.
//
// D[7] has the highest priority and D[0] has the lowest priority.
// valid is 1 when at least one input bit is asserted.
module priority8 (
    input  wire [7:0] D,
    output reg  [2:0] Y,
    output wire       valid
);
    always @(*) begin
        casex (D)
            8'b1xxxxxxx: Y = 3'd7;
            8'b01xxxxxx: Y = 3'd6;
            8'b001xxxxx: Y = 3'd5;
            8'b0001xxxx: Y = 3'd4;
            8'b00001xxx: Y = 3'd3;
            8'b000001xx: Y = 3'd2;
            8'b0000001x: Y = 3'd1;
            8'b00000001: Y = 3'd0;
            default:     Y = 3'd0;
        endcase
    end

    assign valid = |D;
endmodule
