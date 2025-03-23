/*
 * alu: A simple, parameterized ALU module for PA221 course.
 *
 * This ALU supports a set of basic arithmetic and logical operations on two DW-bit operands A and B,
 * selected by a 3-bit opcode. The supported operations are:
 *
 *   Opcode  Operation Description
 *   -------------------------------------------------------------
 *   3'b000  ADD:  Computes A + B.
 *
 *   3'b001  SUB:  Computes A - B.
 *
 *   3'b010  MUL:  Performs multiplication of A and B. The full product of two DW-bit numbers is 2*DW bits wide.
 *          To provide the full product within a DW-bit output, the multiplication operation is implemented to
 *          automatically produce two valid outputs (with dvout asserted) on consecutive clock cycles:
 *
 *          - First Cycle:
 *              * When dvin is asserted with opcode 3'b010, the ALU computes the full 2*DW-bit product of A and B,
 *                and stores it internally.
 *              * The lower DW bits of the product (bits [DW-1:0]) are immediately output on 'out'.
 *              * The ALU sets an internal flag (mul_phase) to indicate that the upper half is pending.
 *
 *          - Second Cycle:
 *              * On the subsequent clock cycle, the ALU automatically asserts dvout and outputs the upper DW bits
 *                of the stored product.
 *              * After outputting the upper half, the mul_phase flag is cleared.
 *
 *          - Interruption of Multiplication:
 *              * If a new dvin is asserted with any opcode (not just opcode 3'b010) while a multiplication is
 *                still in progress (i.e. the upper half of the product is pending and mul_phase is active), the ALU
 *                immediately discards the pending upper half of the previous multiplication.
 *              * The new operation is then processed as requested. In the case of a new multiplication, a fresh
 *                product is computed and its lower DW bits are output; in the case of any other operation, that
 *                operation is processed normally.
 *
 *          This design ensures that the ALU always responds to the latest input command. Even if a multiplication is
 *          in progress, any new operation (of any type) will override the pending multiplication result.
 *
 *
 *   3'b011  AND:  Performs a bitwise AND on A and B.
 *
 *   3'b100  OR:   Performs a bitwise OR on A and B.
 *
 *   3'b101  XOR:  Performs a bitwise XOR on A and B.
 *
 *   3'b110  NOT:  Performs a bitwise NOT on A (operand B is ignored).
 *
 * Input Signals:
 *   - clk:    Clock signal (synchronous operation).
 *   - rst:    Active-high reset signal that clears all internal state.
 *   - dvin:   Data valid input signal; when asserted, the ALU processes the current operation.
 *   - A, B:   DW-bit operands (for NOT, B is ignored).
 *   - opcode: 3-bit selector for the operation.
 *
 * Output Signals:
 *   - out:    DW-bit result of the selected operation.
 *   - dvout:  Data valid output signal; when asserted, indicates that the value on 'out' is valid.
 *
 */


module alu #(
    parameter DW = 32  // Data width parameter (default: 32)
)(
    input wire clk,               // Clock signal
    input wire rst,               // Reset signal (active high)
    input wire [DW-1:0] A,        // Operand A
    input wire [DW-1:0] B,        // Operand B
    input wire [2:0] opcode,      // 3-bit opcode selector
    input wire dvin,              // Data valid input
    output reg [DW-1:0] out,      // ALU output
    output reg dvout              // Data valid output
);

    reg [2*DW-1:0] mul_result;   // Register for 2*DW-bit multiplication result
    reg mul_phase;               // Tracks multiplication phase output (0: lower, 1: higher)
    reg [2*DW-1:0] verify_result_mul_phase; // Verify if input A,B coresponds to mul_result during mul_phase asserted
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mul_result = {2*DW{1'b0}};
            out <= {DW{1'b0}};
            mul_phase <= 1'b0;
            dvout <= 1'b0; // EXPERIMENT
        end else begin
            dvout <= 1'b0;      // Default: dvout is inactive unless valid data is produced

            if (dvin) begin // KRISTIAN: Prejde to do vypoctu napr. prerusis nasobenie v druhej faze (mul_phase == 1) a spustis vypocet s dvin  = 0
               dvout <= 1'b1; // Valid output is being generated KRISTIAN: Sus, toto dat na koniec az po vypocte
               case (opcode)
                    3'b000: out <= A + B;           // ADD
                    3'b001: out <= A - B;           // SUB
                    3'b010: begin                   // MUL (Split into 2 cycles)
                        if (!mul_phase) begin
                            mul_result = A * B;                  // Compute full multiplication
                            out <= mul_result[DW-1:0];            // Lower DW bits
                            mul_phase <= 1'b1;                    // Move to upper phase
                        end else begin
                            verify_result_mul_phase = A * B;
                            if (verify_result_mul_phase == mul_result) begin 
                                out <= mul_result[2*DW-1:DW];         // Upper DW bits FIXED OBVIOUS BIT SLICING MISTAKE    
                                mul_phase <= 1'b0;                    // Reset phase
                            end
                            else begin 
                                out <= mul_result[DW-1:0]; // Lower DW bits, interrupted by multiplication with mul_phase asserted, basically ignoring mul_phase
                                mul_phase <= 1'b1; // for better readability, asserted again
                            end
                            
                            
                        end
                    end
                    3'b011: out <= A & B;          // AND
                    3'b100: out <= A | B;           // OR
                    3'b101: out <= A ^ B;           // XOR
                    3'b110: out <= ~A;              // NOT (B ignored)
                    default: out <= {DW{1'b0}};     // Default case: zero output
                endcase
                
            end
        end
    end
endmodule
