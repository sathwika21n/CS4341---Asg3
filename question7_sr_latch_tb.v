`timescale 1ns / 1ps

module question7_sr_latch_tb;
    reg S;
    reg R;
    wire Q;
    wire Qn;

    srLatch dut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $display("Question 7: Testing srLatch...");

        S = 1'b0; R = 1'b1; #1;
        $display("RESET: S=%b R=%b Q=%b Qn=%b", S, R, Q, Qn);
        if (Q !== 1'b0 || Qn !== 1'b1) $display("SR reset failed");

        S = 1'b1; R = 1'b0; #1;
        $display("SET:   S=%b R=%b Q=%b Qn=%b", S, R, Q, Qn);
        if (Q !== 1'b1 || Qn !== 1'b0) $display("SR set failed");

        S = 1'b0; R = 1'b0; #1;
        $display("HOLD:  S=%b R=%b Q=%b Qn=%b", S, R, Q, Qn);
        if (Q !== 1'b1 || Qn !== 1'b0) $display("SR hold failed");

        S = 1'b1; R = 1'b1; #1;
        $display("BAD:   S=%b R=%b Q=%b Qn=%b", S, R, Q, Qn);
        if (Q !== 1'b0 || Qn !== 1'b0) $display("SR invalid-state failed");

        $display("Question 7 test finished.");
        $finish;
    end
endmodule
