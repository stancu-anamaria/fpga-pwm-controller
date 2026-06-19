`timescale 1ns / 1ps
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
