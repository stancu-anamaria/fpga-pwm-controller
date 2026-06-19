`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 01:36:06 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input logic clk,
    input logic rst,
    input logic toggle,
    output logic led,
    output logic [1:0] speed
    );
logic out_f0,out_f1, out_f2, out_f3;
logic out_mux;
logic out_debouncer;
logic data_in, data_out;
logic en;
logic [7:0] out_counter_updown;
logic out_fsm;

FreqDiv #(.LIMIT(500000))
FreqDiv0
(
    .clk(clk),
    .rst(rst),
    .out(out_f0)
    );
FreqDiv #(.LIMIT(250000))
FreqDiv1
(
    .clk(clk),
    .rst(rst),
    .out(out_f1)
    );
FreqDiv #(.LIMIT(125000))
FreqDiv2
(
    .clk(clk),
    .rst(rst),
    .out(out_f2)
    );
FreqDiv #(.LIMIT(62500))
FreqDiv3
(
    .clk(clk),
    .rst(rst),
    .out(out_f3)
    );
Mux Mux(
    .in0(out_f0),
    .in1(out_f1),
    .in2(out_f2),
    .in3(out_f3),
    .sel(speed),
    .out(out_mux)
    );
Debouncer Debouncer
(
		.clk(clk),
		.in(toggle),
		.out(out_debouncer)
	);
Counter Counter(
    .clk(clk),
    .rst(rst),
    .en(out_debouncer),
    .out(speed)
    );
 
always_ff @(posedge clk) begin    
    if(rst == 1)
    	begin
    	data_out <= 0;
    	end
    else
    	data_out <= data_in;
end
assign en= (out_mux & ~data_out);

CounterUpDown CounterUpDown(
    .clk(clk),
    .rst(rst),
    .en(en),
    .up(out_fsm),
    .out(out_counter_updown)
    );
    
SignalToggleFsm STFsm(
    .in(out_counter_updown),
    .clk(clk),
    .rst(rst),
    .out(out_fsm)
    );
PWM PWM(
    .clk(clk),
    .rst(rst),
    .limit(out_counter_updown),
    .out(led)
    );
endmodule
