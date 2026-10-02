# Synchronous FIFO

A parameterized synchronous FIFO designed using Verilog HDL and verified through behavioral simulation in Xilinx Vivado.

## Features

- Parameterized data width
- Parameterized FIFO depth
- Write operation
- Read operation
- Full flag
- Empty flag
- Synchronous reset

## Parameters

| Parameter | Value |
| Data Width | 8 bits |
| FIFO Depth | 32 |

## Project Files

- `FIFO.v` — FIFO RTL design
- `fifo_testbench.v` — Verilog testbench
- `README.md` — Project documentation

## FIFO Operation

The FIFO follows the First-In First-Out principle.

Test sequence:

```text
WRITE → 10
WRITE → 20
READ  → 10
READ  → 20
