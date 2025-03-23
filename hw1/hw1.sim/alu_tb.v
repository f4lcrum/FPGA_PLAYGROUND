/*
 * ALU Verification Instructions:
 *
 *  - Complete the provided testbench (alu_tb.v).
 *  - The testbench should automatically verify that the ALU’s output matches the expected results based on the 
 *    commentary at the beginning of the alu.v file.
 *  - Report a message with expected and actual output if the actual output is different from the expectation.
 *  - The testbench should conclude with a final summary that clearly reports whether the test has PASSED or FAILED.
 * 
 *
 * 1) Start with DW = 4:
 *    - Set the parameter DW to 4 in alu_tb.v.
 *    - Run the testbench with exhaustive testing: simulate all possible combinations of A, B, and opcode.
 *    - Compare the results with the expected behavior as described in the alu.v commentary.
 *
 * 2) Fix the bugs in alu.v for DW = 4:
 *    - Identify any mismatches or bugs from the exhaustive tests.
 *    - Modify the alu.v code so that the ALU output matches the expected results.
 *    - Re-run the exhaustive tests to confirm the fixes.
 *
 * 3) Change DW = 32 and randomize stimuli:
 *    - Backup the alu_tb.v with DW = 4 and exhaustive tests.
 *    - Update the parameter DW to 32.
 *    - Exhaustive testing is not feasible for DW = 32 due to the large input space.
 *    - Modify the testbench to randomize the inputs A, B, opcode, and the delay between asserting dvin = 1
 *      (including cases with subsequential dvin = 1).
 *    - Run the testbench and record any failures or unexpected behavior.
 *
 * 4) Fix the bugs in alu.v for DW = 32:
 *    - Analyze the failures from the randomized test runs.
 *    - Correct the alu.v code to ensure that the ALU behaves correctly for DW = 32.
 *    - Re-run the testbench to confirm that all tests pass.
 *
 * Please document your debugging process and modifications as part of your submission.
 */

module alu_tb;

    parameter DW = 4;
  
    // DUT Signals
    reg             clk;
    reg             rst;
    reg             dvin;
    reg  [2:0]      opcode;
    reg  [DW-1:0]   A, B;
    wire [DW-1:0]   out;
    wire            dvout;
  
    // Global counters for transactions and errors
    integer input_transactions;
    integer output_transactions;
    integer total_errors;
    integer not_asserted_transcations;
    integer i,j;
    // aux signal to indicate the simulation finish
    reg is_finished = 1'b0;
    reg is_interrupted = 1'b0;
  
    // Instantiate DUT (Pozn. Device Under Test ) 
    alu #(.DW(DW)) dut (
      .clk(clk),
      .rst(rst),
      .A(A),
      .B(B),
      .opcode(opcode),
      .dvin(dvin),
      .out(out),
      .dvout(dvout)
    );
  
    // Clock Generation: 10ns period
    initial begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
    // Stimulus Generator Initial Block
    initial begin: tb_stimuli
      // Initializa counters
      input_transactions = 0;
      output_transactions = 0;
      total_errors = 0;
      not_asserted_transcations = 0;
         
      // Generate the reset signal
      #20;
      rst = 0;  // Release reset
      repeat(5) @(negedge clk);
  
      // Generate a series of transactions
      /* complete the code here */
      
      //|----------------------------------------------|
      //|  4BIT TESTS WITH OP INTERRUPT   TEST BEGIN   |
      //|----------------------------------------------|
      
       // A + B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A + B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b001;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A + B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A + B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A + B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A + B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A + B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
      
       // A * B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       
       // A * B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       // A * B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
        
       
        // A * B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       
       // A * B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
      
      // A * B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
      
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       // A * B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
             #20;
            
            is_interrupted = 1;
            dvin = 1'b0;
            
            #20;
            
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
      
      // A - B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A - B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b001;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A - B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A - B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A - B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A - B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A - B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
      
      // A & B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A & B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b001;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A & B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A & B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A & B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A & B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A & B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A | B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A | B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b001;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A | B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A | B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A | B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A | B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A | B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b100;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
           
       // A ^ B operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b000;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A ^ B operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b001;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A ^ B operation interrupt by MUL OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b010;
            
            #40;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
        // A ^ B operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b011;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A ^ B operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b100;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A ^ B operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // A ^ B operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end    
       
       // ~A operation interrupt by ADD OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (j = 0; j < (2**DW); j = j + 1) begin
          A = i;
          B = j;
          opcode = 3'b110;
          dvin = 1'b1;
          #20;
          is_interrupted = 1;
          dvin = 1'b0;
          #20;
          is_interrupted = 0; 
          dvin= 1'b1;
          opcode = 3'b000;
            
          #20;
          rst = 1'b1;
          #20;
          rst = 1'b0;
          #20;
            
        end
         
       
       // ~A operation interrupt by SUB OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (j = 0; j < (2**DW); j = j + 1) begin
          A = i;
          B = j;
          opcode = 3'b110;
          dvin = 1'b1;
          #20;
          is_interrupted = 1;
          dvin = 1'b0;
          #20;
          is_interrupted = 0; 
          dvin= 1'b1;
          opcode = 3'b001;
            
          #20;
          rst = 1'b1;
          #20;
          rst = 1'b0;
          #20;
            
        end
       
        // ~A operation interrupt by MUL OPERATION with ASSERTED DVIN 
          
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (j = 0; j < (2**DW); j = j + 1) begin
          A = i;
          B = j;
          opcode = 3'b110;
          dvin = 1'b1;
          #20;
          is_interrupted = 1;
          dvin = 1'b0;
          #20;
          is_interrupted = 0; 
          dvin= 1'b1;
          opcode = 3'b010;
            
          #40;
          rst = 1'b1;
          #20;
          rst = 1'b0;
          #20;
            
        end
       
        // ~A operation interrupt by AND OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (j = 0; j < (2**DW); j = j + 1) begin
          A = i;
          B = j;
          opcode = 3'b110;
          dvin = 1'b1;
          #20;
          is_interrupted = 1;
          dvin = 1'b0;
          #20;
          is_interrupted = 0; 
          dvin= 1'b1;
          opcode = 3'b011;
            
          #20;
          rst = 1'b1;
          #20;
          rst = 1'b0;
          #20;
            
        end
       
       // ~A operation interrupt by OR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (j = 0; j < (2**DW); j = j + 1) begin
          A = i;
          B = j;
          opcode = 3'b110;
          dvin = 1'b1;
          #20;
          is_interrupted = 1;
          dvin = 1'b0;
          #20;
          is_interrupted = 0; 
          dvin= 1'b1;
          opcode = 3'b100;
            
          #20;
          rst = 1'b1;
          #20;
          rst = 1'b0;
          #20;
            
        end  
       
       // ~A operation interrupt by XOR OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b110;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b101;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end  
       
       // ~A operation interrupt by NOT OPERATION with ASSERTED DVIN 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b110;
            dvin = 1'b1;
            #20;
            is_interrupted = 1;
            dvin = 1'b0;
            #20;
            is_interrupted = 0; 
            dvin= 1'b1;
            opcode = 3'b110;
            
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
            
          end
       end    
            
      //|----------------------------------------------|
      //|  4BIT TESTS AND "DVIN DISABLED" TEST BEGIN   |
      //|----------------------------------------------|
      // A + B operation
      
      for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b000;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
          end
       end
    
        // A - B operation
        
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b001;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
          end
       end
       
       
       // A * B operation
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            #40;
            dvin = 1'b0;           
          end
       end    
       
       // A & B operation
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b011;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
          end
       end
       
       // A | B operation
           
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;    
       
      
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
             A = i;
            B = j;
             opcode = 3'b100;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
          end
       end
       
       // A ^ B operation 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
             A = i;
            B = j;
            opcode = 3'b101;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
          end
       end
        
       // ~A operation (B is ignored) 
         
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
      
       
       for (i = 0; i < (2**DW); i = i + 1) begin 
            A = i;
            opcode = 3'b110;
            dvin = 1'b1;
            #20; 
            dvin = 1'b0;
       end  
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       /* 
       // A * B operation interrupt by ADD OPERATION with not asserted dvin (mul_phase attack) 
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b000;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end    
       
       // A * B operation interrupt by SUB OPERATION with not asserted dvin (mul_phase attack) 
      
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b001;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       // A * B operation interrupt by MUL OPERATION with not asserted dvin (mul_phase attack) 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b010;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
      
        
        // A * B operation interrupt by AND OPERATION with not asserted dvin (mul_phase attack) 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b011;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       
       // A * B operation interrupt by OR OPERATION with not asserted dvin (mul_phase attack) 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b100;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
      
      // A * B operation interrupt by XOR OPERATION with not asserted dvin (mul_phase attack) 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
      
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b101;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       
       // A * B operation interrupt by NOT OPERATION with not asserted dvin (mul_phase attack) 
       
       rst = 1'b1;
       #20;
       rst = 1'b0;
       #20;
       
       for (i = 0; i < (2**DW); i = i + 1) begin
          for (j = 0; j < (2**DW); j = j + 1) begin
            A = i;
            B = j;
            opcode = 3'b010;
            dvin = 1'b1;
            //#20;
            #10;
            dvin = 1'b0;
            opcode = 3'b110;
            #20;
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #20;
          end
       end
       */
       
       
      // 4BIT TESTS AND "DVIN DISABLED" TEST END 
      // Finish the simulation
      #50;
      is_finished = 1'b1;
    end
  
    // Monitor and Checker Initial Block
    initial begin: tb_monitor
      // Local variables for expected value calculation and multiplication handling
      reg [DW-1:0] expected_result;
      reg [2*DW-1:0] mul_result;
      reg mul_phase;
      reg [DW-1:0] A_reg, B_reg;
      reg [2:0] op_reg;
      reg [DW-1:0] control_result;
      reg [2*DW-1:0] multcheck;
      // Monitor the output and check against expected values
      mul_phase = 0;
      forever begin
        @(posedge clk);
        if (is_interrupted) begin 
            mul_phase = 0; //reset for rightly calculating the output transcactions
        end
        if (dvout && (A_reg == A && B_reg == B && op_reg == opcode && ~is_interrupted)) begin
          if (dvin == 1'b0) begin 
            not_asserted_transcations = not_asserted_transcations + 1;
          end
          expected_result = out;
          
          if (op_reg == 3'b010) begin 
            mul_phase = ~mul_phase;  
          end
         
          dvin = 1'b0;
          // Increment transaction counter, if multiplication then only on first phase
          /* complete the code here */
          
                   
          if (op_reg == 3'b010) begin 
            if (mul_phase) begin 
                output_transactions = output_transactions + 1;
            end
          end 
          else begin
            /*
            if (~mul_phase) begin 
                output_transactions = output_transactions + 1;
            end
            */
            output_transactions = output_transactions + 1;
          end         
          
          
          // Check the output against the expected value
          // and report any errors
          /* complete the code here */
         
          // A + B 
          control_result = A_reg + B_reg;
          if (op_reg == 3'b000 && (control_result != expected_result) && ~mul_phase) begin
            total_errors = total_errors + 1;
          end
          
          // A - B
          control_result = A_reg - B_reg;
          if (op_reg == 3'b001 && ((A_reg - B_reg) != expected_result) && ~mul_phase) begin
            total_errors = total_errors + 1;
          end
          
          // A * B
          
          if (op_reg == 3'b010) begin
            multcheck = A_reg * B_reg;
            if (~mul_phase) begin 
                if(expected_result != multcheck[2*DW-1:DW]) begin 
                    total_errors = total_errors + 1;
                end
            end
            else begin 
                if (expected_result != multcheck[DW-1:0]) begin 
                    total_errors = total_errors + 1;
                end
            end
          end
          
          // A & B 
          if (op_reg == 3'b011 && ((A_reg & B_reg) != expected_result) && ~mul_phase) begin
            total_errors = total_errors + 1;
          end
          
          // A | B 
          if (op_reg == 3'b100 && ((A_reg | B_reg) != expected_result) && ~mul_phase) begin 
            total_errors = total_errors + 1;
          end
          
          // A ^ B
          if (op_reg == 3'b101 && ((A_reg ^ B_reg) != expected_result) && ~mul_phase) begin 
            total_errors = total_errors + 1;
          end
          
          
          // ~A operation,  B is ignored
          if (op_reg == 3'b110 && (~A_reg  != expected_result) && ~mul_phase) begin 
            total_errors = total_errors + 1;
          end
          
        end
        if (dvin && ~is_interrupted) begin
          // Capture the current transaction inputs
          A_reg  = A;
          B_reg  = B;
          op_reg = opcode;
          // Increment input transaction counter
          input_transactions = input_transactions + 1;
        end        
        
        if (dvout && ~dvin && mul_phase) begin 
            if (opcode == 3'b010 && ~is_interrupted) begin // Enable to begin second phase of mult
                dvin = 1;
            end
        end
      end
    end
  
  // Summary report when simulation is finished
  initial begin
    // Wait until the stimulus generator has finished
    wait(is_finished);
    #100;
    $display("===========================================");
    $display("TESTBENCH SUMMARY:");
    $display("Input Transactions:  %0d", input_transactions);
    $display("Output Transactions: %0d", output_transactions);
    $display("Total Errors:        %0d", total_errors);
    $display("Total not asserted transcations: %0d", not_asserted_transcations);
    if (total_errors == 0 && input_transactions == output_transactions && not_asserted_transcations == 0)
      $display("FINAL RESULT: PASSED");
    else
      $display("FINAL RESULT: FAILED");
    $display("===========================================");
    $finish;
  end
  
  endmodule
  