`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 12:21:46 PM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input logic in0,
    input logic in1,
    input logic in2,
    input logic in3,
    input logic [1:0] sel,
    output logic out
    );
    
 always_comb begin
    case(sel)
    2'd0: out=in0;
    2'd1: out=in1;
    2'd2: out=in2;
    2'd3: out=in3;
    endcase
end
endmodule
