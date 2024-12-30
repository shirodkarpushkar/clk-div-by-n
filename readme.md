# Divide-by-N RTL Design

A **Divide-by-N** circuit is a sequential digital circuit that reduces the frequency of an input clock signal by a factor of `N`.

### How It Works

- The circuit takes a clock signal as input and produces an output clock signal whose frequency is `1/N` of the input clock frequency.
- This is typically achieved using a counter and flip-flops. The counter counts input clock cycles and toggles the output after every `N` cycles.
- For example, if the input clock frequency is `100 MHz` and `N = 4`, the output clock frequency will be `25 MHz`.

### Applications

- Frequency division for clock generation in digital systems.
- Generating slower clocks for peripherals and devices in microcontrollers or SoCs.
- Pulse-width modulation (PWM) and signal generation.
- Implementing baud rate generators for UART or other serial protocols.

---

## Directory Structure

- **`rtl/`**: Contains the Verilog source files (`*.sv`) for the Divide-by-N design.
- **`testbench/`**: Contains the testbench files (`*.sv`) for simulation.

---

## Makefile Targets

The `Makefile` defines the following targets:

```
vlib work 
```
Use this command to create a new library named `work` in the current directory.


### 1. **`compile`**

- **Description**:  Compiles the RTL design and testbench files.
- **Command**:

  ```bash
  make compile
  ```
- **Output**: Generates the `compile` directory with the compiled design files.

### 2. **`simulate`**
 
- **Description**:  Simulates the compiled design using the testbench.

- **Command**:

  ```bash
  make simulate
  ```

- **Output**: Runs the simulation and generates the `waves.vcd` file.

### 3. **`debug`**

- **Description**:  Launches the intel FPGA viewer to debug the simulation.

- **Command**:

  ```bash
  make debug
  ```

- **Output**: Opens the waveform viewer with intel FPGA modelsim.
