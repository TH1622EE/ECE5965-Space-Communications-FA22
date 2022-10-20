# ECE5965 Project 1 - Satellite Constellation Simulation Research

## Introduction
This directory contains all of the MATLAB source code to execute the various orbital specific simulations scripts as well as LaTeX source code for the creation of the IEEE formatted report and all supporting documentation. The following table is a system and application overview of the build system for this repo:

|  OS/App  |  Version  |
|  :--     |  :--:     |
| Windows  |  11       |
| MATLAB   |  R2022b   |
| Git      |  2.38.0   |


## Getting Started
1. Clone this repos to your local machine using the following command:

    `git clone https://github.com/th1622EE/ECE5965-Space-Communications-FA22.git ECE5965`

2. Run the shell script(s) for the desired constellation (i.e., LEO, MEO, HEO, GEO, or ALL) to launch MATLAB and run the sim from bash/git bash terminal using the following command(s):
   
    `cd ECE5965/Project-1 && ./runLEOsim.sh`

    `cd ECE5965/Project-1 && ./runMEOsim.sh`

    `cd ECE5965/Project-1 && ./runHEOsim.sh`

    `cd ECE5965/Project-1 && ./runGEOsim.sh`

    `cd ECE5965/Project-1 && ./runCombosim.sh`

3. Run the desired constellation (i.e., LEO, MEO, HEO, GEO, or ALL) from within MATLAB by inputting the following command into the Command Window while in the Project-1 directory:

    `leoSim`

    `meoSim`

    `heoSim`

    `geoSim`

    `comboSim`

4. To run the Live Script to follow a step-by-step execution process load "project1Sim.mlx" and execute each section by clicking "Run and Advance" to view the constellation, analyze changes in velocity, latency, doppler frequency, etc..