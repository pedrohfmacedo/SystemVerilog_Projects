# Hardware Design
This repository contains my Hardware Design projects
Each Project has a folder, where you can find a project_XX.txt file that contains project description/details

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
