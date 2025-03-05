module memory (
	input [3:0] index   , // Address input
	output reg [8:0] data_output     // Data output
);



     
always @(*)
begin
  case (index)
   4'h0: data_output = 9'b101000001; //A
   4'h1: data_output = 9'b101101000; //h
   4'h2: data_output = 9'b101101111; //o
   4'h3: data_output = 9'b101101010; //j
   4'h4: data_output = 9'b100100000; // whitespace
   4'h5: data_output = 9'b101010000; //P
   4'h6: data_output = 9'b101010110; //V
   4'h7: data_output = 9'b100110010; //2
   4'h8: data_output = 9'b100110000; //0
   4'h9: data_output = 9'b100110000; //0
   4'ha: data_output = 9'b100100001; //!
   4'hb: data_output = 9'b000000000;
   4'hc: data_output = 9'b000000000;
   4'hd: data_output = 9'b000000000;
   4'he: data_output = 9'b000000000;
   4'hf: data_output = 9'b000000000;
   default: data_output = 9'hXXX;
  endcase
end
endmodule