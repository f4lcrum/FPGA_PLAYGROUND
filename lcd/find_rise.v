// produce one pulse, when input in was changed from 0 to 1

module find_rise (
	input clk,
	input in,
	output reg out);
  
	reg old = 1'b0;

	always @(posedge clk) begin
		old <= in;
		out <= in & (~old);
  	end

endmodule