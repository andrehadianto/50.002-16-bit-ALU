# 50.002-16-bit-ALU
## Introduction
The aim of the project is to design a working 16-bit ALU on an FPGA. We programmed the 16-bit ALU using MOJO IDE written in Lucid HDL tested on a Mojo V3 PGA Development Board. We refer to Lab 3 ALU documentation for the functions of the ALU which include these features: Adder, Multiplier, Boolean, Shifter, and Comparator, shown in the image below.
<insert image>

The program includes two methods of testing: manual and automated testing.

## Manual Testing
To run the manual testing, power the FPGA board and wait for the seven segment display to show the word "IDLE". Adjust the wanted operation by changing the 6-bit ALUFN code represented by dips number 16 to 21 (0:5). 
Press the UP button and wait until the display shows "INPA" which stands for "Input A". The FPGA will now wait for the input. Enter the 16-bit value for A by switching dips number 0 to 15. Lit LED represents '1' and unlit LED represents '0'. 
Press the DOWN button and wait until the display shows "INPB" which stands for "Input B". At the same time, this will confirm the input for A. Do the same for B by switching dips number 0 to 15.
Press the CENTER button to calculate the values using the chosen operators.
If any mistake occurs, press the LEFT button to reset the FPGA to its initial state.

## Automated Testing
To run the automated testing, just press the RIGHT button and wait for the display to show the word "AUTO".
The automated testing tests each operations 3times in this order:
ADDER
- ADDition
- SUBtraction
- MULtiplication

BOOLEAN
- AND
- OR
- XOR

SHIFTER
- Shift Left
- Shift Right
- Shift Right Assigned

COMPARATOR
- Compare equal to
- Compare less than
- Compare less than equal
