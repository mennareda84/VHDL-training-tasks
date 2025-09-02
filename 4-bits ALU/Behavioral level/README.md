# 4-bit ALU (Behavioral Level)

## Project Idea

An Arithmetic Logic Unit (ALU) is a combinational digital circuit that performs arithmetic and bitwise operations on integer binary numbers. It is a fundamental component of processors.

The ALU takes two 4-bit operands and a 3-bit opcode as input. According to the opcode, it performs the operation and produces an 8-bit result.

---

## Function

**Inputs**

* `Operand1` : 4-bit binary number
* `Operand2` : 4-bit binary number
* `Opcode` : 3-bit binary number selecting the operation

**Output**

* `Result` : 8-bit binary number representing the result of the operation

---

## Opcode Table

| Opcode | Operation      | Result Description                       |
| ------ | -------------- | ---------------------------------------- |
| 000    | Addition       | Result = Operand1 + Operand2             |
| 001    | Subtraction    | Result = Operand1 - Operand2             |
| 010    | Multiplication | Result = Operand1 \* Operand2            |
| 011    | Greater Than   | Result = 1 if Operand1 > Operand2 else 0 |
| 100    | Less Than      | Result = 1 if Operand1 < Operand2 else 0 |
| others | No Operation   | Result = 0                               |

---

## Design Methodology

The ALU is implemented using behavioral modeling by directly applying operations (+, -, *, >, <) based on the opcode, which is simpler compared to the structural approach.

## Result (Simulation Waveform)

Simulation waveform:

![Waveform](./waveform/waveform.png)
