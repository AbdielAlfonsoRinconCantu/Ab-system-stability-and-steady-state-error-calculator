# Ab system stability & steady-state error calculator #
This MATLAB script determines the stability of a transfer function, its steady-state error for a step, ramp and parabolic input, its poles, and graphs them.

## Features ##
- Builds the transfer function.
- Gets and graphs the poles of the closed-loop transfer function.
- Determines the stability of the system.
- Computes the steady-state error for a step, ramp and parabolic input.
- Graphs step, ramp and parabolic input response.
- Comments on every line explaining their purpose.

## Requirements ##
- MATLAB.

## How to use ##
1. Open the `.m` file in MATLAB.
2. Modify the `numerador`, `denominador`, `t` and `funcion` variables depending on your system.
3. Run the script.

## Notes ##
- The `numerador` and `denominador` are defined using only the coefficients of the $s$-variable.
- The `clear` function is used at the start of the program, make sure to save any previous variables before running the script.
- The final value theorem is used to compute the steady-state errors.
- The following transfer functions are already included in the script:
  
$$E(s)_1=\frac{4s-8}{s^3+3s^2+18s}$$

$$E(s)_2=\frac{4s-8}{s^2+3s+18}$$

$$E(s)_3=\frac{18}{s^3+20s^2-50s}$$

## How it works ##
|  Function | Description |
| :---: | --- |
| `clear` | Clears all variables from the workspace. |
| `syms` | Defines symbolic variables. |
| `fprintf` | Prints formatted text. |
| `tf` | Creates a transfer function. |
| `feedback` | Computes the closed-loop transfer function. |
| `pole` | Computes the poles of the system. |
| `figure` | Creates a new figure window for plotting. |
| `pzplot` | Generates a pole-zero plot. |
| `title` | Adds a title to a plot. |
| `step` | Plots the step response. |
| `isstable` | Checks stability. |
| `limit` | Computes a limit. |
| `isnan` | Checks if a value is NaN (Not a Number). |
| `lsim` | Simulates the time response of a system. |

| Variable   | Description                                                   |
| :---------:|---------------------------------------------------------------|
| `contador` | Counter variable used for processing.                         |
| `s`        | Symbolic variable, $s$ domain.                                |
| `numerador`| Numerator coefficients of transfer function.                  |
| `denominador` | Denominator coefficients of transfer function.             |
| `t`        | Time vector for simulation.                                   |
| `funcion`  | Transfer function for processing.                             |
| `E_s`      | Transfer function E(s).                                       |
| `E_c`      | Closed-loop transfer function Ec(s).                          |
| `estabilidad` | Boolean indicating stability of the system.                |
| `Escalon`  | Steady-state error for step input.                            |
| `Rampa`    | Steady-state error for ramp input.                            |
| `Parabola` | Steady-state error for parabolic input.                       |

## Contributors ##
- Abdiel Alfonso Rincon Cantu

## Acknowledgments ##
Special thanks to Dr. Jorge Quishpe-Armas for providing the documentation that laid the groundwork for this script.

## **License** ##  
MIT License

Copyright (c) 2024 Abdiel Alfonso Rincon Cantu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

