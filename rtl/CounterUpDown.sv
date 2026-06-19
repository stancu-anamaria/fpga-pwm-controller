`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 12:24:41 PM
// Design Name: 
// Module Name: CounterUpDown
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


module CounterUpDown(
    input logic clk,
    input logic rst,
    input logic en,
    input logic up,
    output logic [7:0] out
    );
always_ff @(posedge clk) begin
    if(rst==1)
        out <=0;
    else 
        if(en==0)
            out<=out;
        else 
            if(up==1) out <= out + 1;
            else out <= out - 1;
end
endmodule
