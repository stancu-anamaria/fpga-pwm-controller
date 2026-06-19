`timescale 1ns / 1ps
module Debouncer
#(parameter limit = 20'd650000)
(
		input logic clk,
		input logic in,
		output logic out
	);

logic [19:0] counter; 
logic hit;

assign out = (counter == limit);

always_ff @(posedge clk) begin
	if(in == 0) 
		begin
		counter <= 0;
		hit <= 0;        
		end 
	else 
		begin
		if(counter == limit) 
			begin
			hit <= 1;
			counter <= counter + 1;
			end 
		else 
			begin
			if(in == 1 & hit == 0) 
				begin
				counter <= counter + 1;
				end
			end
		end
end

endmodule
