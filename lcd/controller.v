module controller(
	//////////// CLOCK //////////
	input 		          		clk,
	
	input 							lcd_busy,
	
	input 							reset_button,
	input 							first_run,
	//////////// OUTPUT //////////
	output		     	reg			data_ready,
	output				reg [3:0]		data_index
);

reg halt = 1'b0;
reg prev_reset = 1'b0;
reg current_lcd_state = 1'b0;


	always @(posedge clk) begin
		if (reset_button) begin
			data_index 		<= 4'b0000;
			halt 				<= 1'b0;
			data_ready 		<= 1'b0;
			current_lcd_state <= lcd_busy;
		end
		
		if (prev_reset != reset_button) begin
			prev_reset <= reset_button;
			if (reset_button == 1'b0) begin
				halt <= 1'b0;
			end
		end
		
		if (data_index == 4'b1111) begin
			halt <= 1'b1;
			data_ready <= 1'b0;
		end
		
		
		if (halt == 1'b0) begin
			if (current_lcd_state != lcd_busy) begin // change of state
				current_lcd_state <= lcd_busy;
				if (lcd_busy == 1'b0) begin // lcd is ready for data and it yet not accepted
					data_ready <= 1'b1;
				end
				else if (lcd_busy == 1'b1 && data_ready == 1'b1) begin // lcd is not ready for data: because it's printing the data u send in previous clock
					if (first_run == 1'b1) begin
						data_index <= 4'b0000;
					end
					else begin
						data_index <= data_index +  4'b0001;
					end
					data_ready <= 1'b0;
				end
			end
		end
		
	end




endmodule

