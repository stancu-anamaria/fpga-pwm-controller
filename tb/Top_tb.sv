`timescale 1ns / 1ps
module Top_tb();

logic clk;
logic rst;
logic toggle;
logic led;
logic [1:0] speed;

initial begin
    clk=0;
    forever #2 clk=~clk;
end
initial begin
    rst <=1;
    @(posedge clk);
    @(posedge clk);
    rst <=0;
end
initial begin 
    toggle<=0;
    @(posedge clk);
    @(posedge clk);
    forever begin
        repeat (50) @(posedge clk);
        toggle <= 1;
        repeat (700) @(posedge clk);
        toggle <= 0;
    end
 end
initial #1000 $stop();
Top dut (.*);  
endmodule
