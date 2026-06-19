`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 12:29:47 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [1:0] out
    );
always_ff @(posedge clk) begin
    if(rst==1)
        out <=0;
    else 
        if(en==0)
            out<=out;
        else out <= out + 1;
end
endmodule
