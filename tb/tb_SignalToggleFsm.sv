`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 02:28:56 PM
// Design Name: 
// Module Name: tb_SignalToggleFsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_SignalToggleFsm();
logic [7:0] in;
logic clk;
logic rst;
logic out;

initial begin
    clk=0;
    forever #1 clk=~clk;
end
initial begin
    rst <=1;
    @(posedge clk);
    @(posedge clk);
    rst <=0;
end

initial begin
    in <= 0;
    @(posedge clk);
    forever begin 
        repeat(255) begin
            @(posedge clk);
            in <= in + 1;
            end
         repeat(255) begin
            @(posedge clk);
            in <= in - 1;
            end
      end 
end 
initial #1024 $stop();
SignalToggleFsm dut (.*);
endmodule
