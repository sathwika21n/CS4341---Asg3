# CS4341 Assignment 3: Questions 1, 5, and 7

This folder contains Verilog HDL answers for:

- Question 1: 32-bit ALU
- Question 5: eight-input priority circuit
- Question 7: SR latch

## Files

- `question1_alu32.v`: HDL module for question 1
- `question5_priority8.v`: HDL module for question 5
- `question7_sr_latch.v`: HDL module for question 7
- `questions_1_5_7_tb.v`: simple testbench for the three modules

## Question 1 ALU Controls

The `alu32` module uses the common Figure 5.15 MIPS-style ALU operation encoding:

| ALUControl | Operation |
| ---------- | --------- |
| `000` | AND |
| `001` | OR |
| `010` | ADD |
| `110` | SUBTRACT |
| `111` | SET LESS THAN, signed |

The `Zero` output is asserted when the ALU result is `0`.

## Running the Testbench

If Icarus Verilog is installed:

```sh
iverilog -o questions_1_5_7_tb.out question1_alu32.v question5_priority8.v question7_sr_latch.v questions_1_5_7_tb.v
vvp questions_1_5_7_tb.out
```
