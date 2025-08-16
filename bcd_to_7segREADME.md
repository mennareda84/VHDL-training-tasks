# BCD to 7-Segment Decoder

## Description
This task implements a **BCD to 7-Segment decoder**.  
The decoder takes a 4-bit input and drives a 7-segment display to show the corresponding decimal digit (0–9).

## Function
- Input: 4-bit A
- Output: 7-bit BCD_out (Active Low)

## Truth Table

| BCD Input (DCBA) | Digit | a | b | c | d | e | f | g |
|------------------|-------|---|---|---|---|---|---|---|
| 0000             | 0     | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 0001             | 1     | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 0010             | 2     | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 0011             | 3     | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 0100             | 4     | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 0101             | 5     | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 0110             | 6     | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0111             | 7     | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 1000             | 8     | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1001             | 9     | 0 | 0 | 0 | 0 | 1 | 0 | 0 |

- In this design, when inputs are above `1001` (decimal 9), the output is forced to all ones (`1111111`).

## Result (Simulation Waveform)

The waveform from the simulation of the design:

![Waveform](./waaveforms/waveform.png)
