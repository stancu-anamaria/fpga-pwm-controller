`timescale 1ns / 1ps
module SignalToggleFsm(
    input logic [7:0] in,
    input logic clk,
    input logic rst,
    output logic out
    );
localparam Q0=1'b1;
localparam Q1=1'b0;

logic state;

always_ff @(posedge clk) begin
    if(rst==1) begin
        state <= Q0;
        out <= 1'b1;
        end
    else case(state)
    Q0: if(in == 8'd255) begin
            state <= Q1;
            out <= 1'b0;
            end
         else out <= 1'b1;
    Q1: if(in== 8'd0) begin
            state <= Q0;
            out <= 1'b1;
            end
         else out <= 1'b0; 
    endcase
 end

endmodule
