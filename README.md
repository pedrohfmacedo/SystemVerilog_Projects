# Hardware Design
This repository contains my Hardware Design projects in SystemVerilog or Verilog
Each Project has a folder, where you can find a project_XX.txt or project_xx.pdf file that contains project description/details

#### Software
* EDAPlaygorund (Icarus Verilog 0.10 or Cadence XCELIUM 20.09)
* Xcelium 

#### Operational System
* WSL Linux 
* Linux Redhat

## Project 1: Thunderbird Turn Signal

### Project Overview

I designed a finite state machine in SystemVerilog to control the taillights of a 1965 Ford Thunderbird. There were three lights on each side that operate in sequence to indicate the direction of a turn. The sequence was designed to complete even when the button was released during it. If none of the buttons or both left and right button were pressed in initial states, no lights were turned on.

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL.

## Project 2: Sequence identifier

### Project Overview

I designed a finite state machine in SystemVerilog for least significant 4-bit sequence identifier in ASCII code. There were three lights on each side that worked in sequence to indicate the direction of a turn. The sequence was designed to be completed even when the button was released during it. If neither button or both left and right buttons were pressed in the initial states, no lights were turned on.

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL and $display, $dumpfile

## Project 3: Orderer
​
### Project Overview

Design a combinational circuit in SystemVerilog to sort 8 unsigned 8-bit numbers.

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL

## Project 4: Decoder Huffman 
​
### Project Overview

I designed a sequential circuit (Finite State Machine) in SystemVerilog based on the huffman decoder that performs decoding according to the attached table.

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL

## Project 5: Converter BCD 
​
### Project Overview

The ConvertBCD block was created, which converts only one input signal to the BCD type output, that is, a [3:0] output was instantiated together
Made a 1:4 input block, for reuse.

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL

## Project 6: FSM BCD to binary
​
### Project Overview

FSM BCD that converts only one input signal to the BCD type output, that is, a [3:0] output and
reusing the project_05 block

### Learning Objectives
* Design an FSM, starting with only a textual description of its operation.
* Implement a digital design using the SystemVerilog HDL.
* Write a testbench using the SystemVerilog HDL
