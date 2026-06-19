`timescale 1ns / 1ps
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
