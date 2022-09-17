`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2022 11:22:50 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCnt,
    output reg [31:0] ALUout,
    output reg N,
    output reg Z,
    output reg C,
    output reg V
    );
    
    localparam ZERO = 1'b0;
    reg [31:0] B2;
    // All inputs are in the sensitivity list
    always@(*) begin // or always@(A, B, ALUCnt) begin
        case(ALUCnt)
            
            // AND gate
            4'b0000: begin
                ALUout = A & B;
                Z = ALUout == ZERO;
                N = ALUout[31];
                V = 1'dx;
                C = 1'dx;
            end
            
            // OR gate
            4'b0001: begin
                ALUout = A | B;
                Z = ALUout == ZERO;
                N = ALUout[31];
                V = 1'dx;
                C = 1'dx;
            end
            
            // XOR gate
            4'b0011: begin
                ALUout = A ^ B;
                Z = ALUout == ZERO;
                N = ALUout[31];
                V = 1'dx;
                C = 1'dx;
            end
            
            //  Addition Unsigned
            4'b0010: begin
                {C, ALUout} = A + B;
                V = C;
                Z = ALUout == ZERO;
                N = ALUout[31];
            end
            
            // Subtraction Unsigned
            4'b0110: begin
                {C, ALUout} = A + (-B);
                V = A < B;
                Z = ALUout == ZERO;
                N = ALUout[31];
            end
            
            // NOR gate
            4'b1100: begin
                ALUout = ~(A | B);
                Z = ALUout == ZERO;
                N = ALUout[31];
                V = 1'dx;
                C = 1'dx;
            end
            
            // NOT gate
            4'b0111: begin
                ALUout = ~A;
                Z = ALUout == ZERO;
                N = ALUout[31];
                V = 1'dx;
                C = 1'dx;
            end
            
            // Shift left logical
            4'b1101: begin
               {C, ALUout} = A<<1;
               Z = ALUout == ZERO;
               V = 1'dx;
               N = ALUout[31];
            end
            
            // Addition Signed
            4'b1010: begin
                {C, ALUout} = A + B;
                V = (A[31] == B[31]) & (ALUout[31] != A[31]);
                Z = ALUout == ZERO;
                N = ALUout[31];
            end
            
            // Subtraction Signed
            4'b1110: begin
                B2 = (~B) + 1'b1;
                {C, ALUout} = A + B2;
                V = (A[31] == B[31]) & (ALUout[31] != A[31]);
                Z = ALUout == ZERO;
                N = ALUout[31];
            end
            
            // Default
            default: begin
                ALUout = 32'dx;
                C = 1'dx;
                Z = 1'dx;
                V = 1'dx;
                N = 1'dx;
            end
        endcase
    end
                
                
endmodule
