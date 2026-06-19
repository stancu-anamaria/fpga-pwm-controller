`timescale 1ns / 1ps
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
