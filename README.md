# VerilogBoy GFMPW0

Uses VerilogBoy design from https://github.com/zephray/VerilogBoy.

VerilogBoy is a GameBoy-compatible system design in synthesizable Verilog RTL. The submission for GFMPW0 includes the following components:

- SM83 (GBZ80) CPU core
- Pixel processing unit
- Programmable sound generator
- Timer
- Stereo PDM audio output

To form a complete GB system, users need to provide the following additional components:

- Generic 16KB Async SRAM
- Some buttons for input
- 160x144 LCD
- Low pass filter and audio amplifier
- Unmodified GameBoy game cartridge
- Small amount of glue logic

The simtop.v maybe used as a reference on external components required.

A Verilator-based testbench is provided in verilog/sim.

## Implementation Results

The implementation has 43% ultilization of a 1.5mm x 1.5 mm core area. The Fmax is around 20MHz at typical corner, 3.3V with no hold violation. The design is supposed to run up to 4MHz at 5V.

## License

Unless otherwise stated, HDL codes are licensed under OHDL 1.0, and software codes are licensed under MIT.
