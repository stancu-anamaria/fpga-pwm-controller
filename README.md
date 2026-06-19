# fpga-pwm-controller
SystemVerilog FPGA implementation of a variable-speed PWM controller using FSMs, counters, multiplexers, and frequency dividers.

## Overview

This project implements a configurable PWM-based LED controller on FPGA using SystemVerilog. The system combines frequency dividers, counters, multiplexers, debouncing logic, and a finite state machine to generate a PWM signal with dynamically varying duty cycle.

The operating speed can be changed using a push button, allowing the user to select between four predefined frequencies. The selected speed affects the generated PWM waveform and the LED blinking behavior.

## Architecture

The design is composed of several interconnected modules:

### FreqDiv

Parameterized frequency divider used to generate clock-enable signals corresponding to:

* 100 Hz
* 200 Hz
* 400 Hz
* 800 Hz

The active frequency is selected through a multiplexer.

### Debouncer

Filters mechanical bouncing produced by the push button and generates a clean pulse used by the speed selection counter.

### Counter (2-bit)

Stores the currently selected operating speed.

| Value | Frequency |
| ----- | --------- |
| 00    | 100 Hz    |
| 01    | 200 Hz    |
| 10    | 400 Hz    |
| 11    | 800 Hz    |

The counter value is also exposed through the `speed` output.

### Mux

Selects one of the four divided frequencies according to the current speed setting.

### SignalToggleFsm

Finite State Machine controlling the counting direction.

Behavior:

* After reset, output is `1`.
* Output remains `1` while the counter increases.
* When the counter reaches `255`, output becomes `0`.
* Output remains `0` while the counter decreases.
* When the counter reaches `0`, output becomes `1` again.

### CounterUpDown

8-bit counter with enable input and up/down control input.

* Counts upward when `up = 1`
* Counts downward when `up = 0`

The counter value determines the PWM duty cycle.

### PWM

Generates a PWM signal using:

* an internal 8-bit counter
* the value provided by `CounterUpDown`

As the duty-cycle reference changes continuously, the output LED gradually increases and decreases in brightness.

## Top-Level Operation

1. The user presses the speed button.
2. The Debouncer validates the button press.
3. The 2-bit Counter increments.
4. The Mux selects a new operating frequency.
5. The selected frequency drives the PWM control logic.
6. The FSM decides whether the duty-cycle counter should count up or down.
7. The CounterUpDown updates the duty-cycle value.
8. The PWM module generates the output waveform.
9. The LED brightness smoothly fades in and out.

## FPGA Connections

| Signal     | Board Resource |
| ---------- | -------------- |
| clk        | FPGA clock     |
| rst        | BTN0           |
| toggle     | BTN1           |
| led        | LED0           |
| speed[1:0] | LED15, LED14   |

## Simulation

### tb_Top

Verifies:

* reset behavior
* speed selection
* frequency switching
* PWM generation
* complete system integration

### tb_SignalToggleFsm

Verifies:

* transition at input value 255
* transition at input value 0
* FSM state retention
* correct output toggling behavior

## Technologies

* SystemVerilog
* FPGA Design
* Digital Logic Design
* Finite State Machines (FSM)
* PWM Signal Generation
* Vivado

