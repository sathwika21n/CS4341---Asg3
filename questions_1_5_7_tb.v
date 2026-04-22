`timescale 1ns / 1ps

module questions_1_5_7_tb;
    reg  [31:0] A;
    reg  [31:0] B;
    reg  [2:0]  ALUControl;
    wire [31:0] Result;
    wire        Zero;

    reg  [7:0] priority_in;
    wire [2:0] priority_out;
    wire       priority_valid;

    reg S;
    reg R;
    wire Q;
    wire Qn;

    alu32 dut_alu (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero)
    );

    priority8 dut_priority (
        .D(priority_in),
        .Y(priority_out),
        .valid(priority_valid)
    );

    sr_latch dut_latch (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $display("Testing alu32...");
        A = 32'h0000000f; B = 32'h00000033; ALUControl = 3'b000; #1;
        if (Result !== 32'h00000003) $display("ALU AND failed");

        ALUControl = 3'b001; #1;
        if (Result !== 32'h0000003f) $display("ALU OR failed");

        A = 32'd10; B = 32'd15; ALUControl = 3'b010; #1;
        if (Result !== 32'd25) $display("ALU ADD failed");

        A = 32'd10; B = 32'd10; ALUControl = 3'b110; #1;
        if (Result !== 32'd0 || Zero !== 1'b1) $display("ALU SUB/Zero failed");

        A = -32'sd4; B = 32'sd3; ALUControl = 3'b111; #1;
        if (Result !== 32'd1) $display("ALU SLT failed");

        $display("Testing priority8...");
        priority_in = 8'b00000000; #1;
        if (priority_valid !== 1'b0 || priority_out !== 3'd0) $display("Priority none failed");

        priority_in = 8'b00010010; #1;
        if (priority_valid !== 1'b1 || priority_out !== 3'd4) $display("Priority middle failed");

        priority_in = 8'b10101010; #1;
        if (priority_valid !== 1'b1 || priority_out !== 3'd7) $display("Priority high failed");

        $display("Testing sr_latch...");
        S = 1'b0; R = 1'b1; #1;
        if (Q !== 1'b0 || Qn !== 1'b1) $display("SR reset failed");

        S = 1'b1; R = 1'b0; #1;
        if (Q !== 1'b1 || Qn !== 1'b0) $display("SR set failed");

        S = 1'b0; R = 1'b0; #1;
        if (Q !== 1'b1 || Qn !== 1'b0) $display("SR hold failed");

        S = 1'b1; R = 1'b1; #1;
        if (Q !== 1'b0 || Qn !== 1'b0) $display("SR invalid-state failed");

        $display("Tests finished.");
        $finish;
    end
endmodule
