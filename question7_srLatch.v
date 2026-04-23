`timescale 1ns / 1ps

// Question 7
// Active-high SR latch built from cross coupled NOR gates.
// S=1, R=0 sets Q to 1.
// S=0, R=1 resets Q to 0.
// S=0, R=0 holds the previous value.
// S=1, R=1 is invalid because it forces Q and Qn low at the same time.
module srLatch (
    //set input
    input  wire S,
    //reset input
    input  wire R,
    //main output
    output wire Q,
    //complement output
    output wire Qn
);
    //first NOR gate 
    //Q= NOT(R | Qn)
    nor (Q, R, Qn);
    //second NOR gate
    //Qn = NOT(S | Q)
    nor (Qn, S, Q);
endmodule
