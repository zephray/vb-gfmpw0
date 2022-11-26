`timescale 1ns / 1ps
`default_nettype wire
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Wenting Zhang
// 
// Create Date:    17:30:26 02/08/2018 
// Module Name:    simtop
// Project Name:   VerilogBoy
// Description: 
//   Top-level wrapper for RTL simulation
////////////////////////////////////////////////////////////////////////////////
module simtop(
    input wire clk,
    input wire rst,
    // Cartridge interface
    output reg [15:0] a,
    output wire [7:0] dout,
    input wire [7:0] din,
    output wire wr,
    output wire rd,
    // Keyboard input
    input wire [7:0] key,
    // LCD output
    output wire hs,
    output wire vs,
    output wire [1:0] pixel,
    output wire valid,
    // For testbench only
    output wire done,
    output wire fault
    );

    wire [15:0] bus_a;
    wire [7:0] bus_dout;
    wire [7:0] bus_din;
    wire bus_doe;
    wire bus_wr;
    wire bus_cale;
    wire bus_cs;
    wire skey;

    chip chip(
        .clk(clk),
        .rst(rst),
        .a(bus_a),
        .dout(bus_dout),
        .din(bus_din),
        .doe(bus_doe),
        .wr(bus_wr),
        .cale(bus_cale),
        .cs(bus_cs),
        .hsync(hs),
        .vsync(vs),
        .pvalid(valid),
        .pixel(pixel),
        .skey(skey),
        .audiol(),
        .audior(),
        .mode(1'b0),
        .done(done),
        .fault(fault)
    );

    wire sram_we;
    wire [7:0] sram_dout;
    async_ram #(.WORDS(16384), .ABITS(14)) sram(
        .clka(clk),
        .wea(sram_we),
        .addra({bus_a[14], bus_a[12:0]}),
        .dina(bus_dout),
        .douta(sram_dout)
    );
    assign sram_we = bus_wr & !bus_cs;

    // OR use transparent latch
    always @(posedge clk) begin
        if (bus_cale)
            a <= bus_a;
    end

    assign dout = bus_dout;
    assign bus_din = bus_cs ? din : sram_dout;
    assign wr = bus_cs & bus_wr;
    assign rd = ~bus_wr; // Always enable output

    // Key parallel to serial
    assign skey = 1'b0;

endmodule
