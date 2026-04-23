`timescale 1ns / 1ps

module question5_priority8_tb;
    reg  [7:0] D;
    wire [2:0] Y;
    wire       valid;

    priority8 dut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $display("Question 5: Testing priority8...");

        D = 8'b00000000; #1;
        $display("D=%b Y=%0d valid=%b", D, Y, valid);
        if (valid !== 1'b0 || Y !== 3'd0) $display("Priority none failed");

        D = 8'b00000001; #1;
        $display("D=%b Y=%0d valid=%b", D, Y, valid);
        if (valid !== 1'b1 || Y !== 3'd0) $display("Priority bit 0 failed");

        D = 8'b00010010; #1;
        $display("D=%b Y=%0d valid=%b", D, Y, valid);
        if (valid !== 1'b1 || Y !== 3'd4) $display("Priority bit 4 failed");

        D = 8'b10101010; #1;
        $display("D=%b Y=%0d valid=%b", D, Y, valid);
        if (valid !== 1'b1 || Y !== 3'd7) $display("Priority bit 7 failed");

        $display("Question 5 test finished.");
        $finish;
    end
endmodule
