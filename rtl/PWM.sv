`timescale 1ns / 1ps
module PWM(
    input logic clk,
    input logic rst,
    input logic [7:0] limit,
    output logic out
    );
logic [7:0] limit_period;
assign limit_period=8'd255;

logic reset;
logic out_comp;
logic [7:0] out_counter;

assign out_comp=(limit_period<=out_counter);
assign reset=rst || out_comp;

always_ff @(posedge clk) begin
    if(reset==1)
        out_counter <=0;
    else out_counter <= out_counter + 1;
end

assign out=(limit>out_counter);

endmodule
