`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 12:14:23 PM
// Design Name: 
// Module Name: FreqDiv
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


module FreqDiv
#(parameter LIMIT=500000)
(
    input logic clk,
    input logic rst,
    output logic out
    );
logic [19:0] counter;
always_ff @(posedge clk) begin
    if(rst==1) begin
        out<=0;
        counter<=0;
        end
     else
        if(counter==LIMIT) begin
            out <= ~out;
            counter <=0;
            end
         else counter = counter + 1;
end
endmodule
