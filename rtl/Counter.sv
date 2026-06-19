`timescale 1ns / 1ps
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
