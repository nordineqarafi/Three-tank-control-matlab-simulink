# Repository name
`three-tank-control-matlab-simulink`

## Repository description
MATLAB/Simulink state-space modelling and control of a three-tank system, with pole-placement state feedback, integral action, static compensation, and an observer.

# Three-Tank Control System - MATLAB/Simulink

## Overview
State-space modelling and control of a three-tank liquid-level system using MATLAB and Simulink. The project includes state feedback, static compensation, integral action, and an observer.

## Tools
- MATLAB
- Simulink
- Control System Toolbox

## Model structure
The plant is represented by `A`, `B`, `C`, and `D` in the standard state-space form. The measured output is defined with `C = [0 0 1]`. The MATLAB script creates the open-loop model with `ss(A,B,C,D)`.

## Controller
- State-feedback gain: `K = acker(A,B,P)`
- Closed-loop matrix: `Ac = A - B*K`
- Transfer-function conversion: `ss2tf(Ac,B,C,D)`
- Static compensation: `H0` and `Sys_F`
- Integral action: augmented matrices `Aa`, `Ba`, and gains `Ka`, `Kia`

## Observer
The observer gain is calculated with pole placement on the transposed pair:

```matlab
L = acker(A',C',Po);
L = L';
```

## Simulink setup
The model contains reference tracking, the three-tank plant, controller inputs, a disturbance input, and an observer. Simulation signals include the actual state vector and the estimated state vector for comparison.

## Files
- MATLAB initialization/design script: defines `A`, `B`, `C`, `D`, controller gains, and observer gain.
- Simulink model: implements the plant, controller, disturbance path, observer, and signal comparison.
- `three_tank_control_project_report.pdf`: concise project report.

## How to run
1. Open MATLAB in the project folder.
2. Run the initialization/design script so that `A`, `B`, `C`, `D`, `K`, `Ka`, `Kia`, and `L` are available in the workspace.
3. Open the Simulink model.
4. Run the simulation and inspect the reference, disturbance, actual-state, and estimated-state signals.
