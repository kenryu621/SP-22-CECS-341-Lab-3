`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2022 10:35:44 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

reg [31:0] A, B;
reg [3:0] ALUCntl;
wire [31:0] ALUOut;
wire Z, V, C, N;
integer i;

alu uut(.A(A), .B(B), .ALUCnt(ALUCntl), .ALUout(ALUOut), .N(N), .V(V), .Z(Z), .C(C));

initial begin
    $timeformat(-9, 1, "ns", 9);
    $display(" ");
    $display("***************************");
    $display("   CECS 341 Lab 3 Demo 1   ");
    $display("***************************");
    $display(" ");
    
    for (i = 0; i < 16; i = i + 1) begin
        case(i)
            4'b0000: begin // Case 1
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b0000;
            end
            4'b0001: begin // Case 2
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b0001;
            end
            4'b0010: begin // Case 3
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b0011;
            end
            4'b0011: begin // Case 4
                A = 32'h00000001; B = 32'hFFFFFFFF; ALUCntl = 4'b0010;
            end
            4'b0100: begin // Case 5
                A = 32'h6389754F; B = 32'hAD5624E6; ALUCntl = 4'b0010;
            end
            4'b0101: begin // Case 6
                A = 32'h00000001; B = 32'hFFFFFFFF; ALUCntl = 4'b0010;
            end
            4'b0110: begin // Case 7
                A = 32'h6389754F; B = 32'hAD5624E6; ALUCntl = 4'b0010;
            end
            4'b0111: begin // Case 8
                A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ALUCntl = 4'b0010;
            end
            4'b1000: begin // Case 9
                A = 32'h00000000; B = 32'h00000001; ALUCntl = 4'b0110;
            end
            4'b1001: begin // Case 10
                A = 32'hF9684783; B = 32'hF998D562; ALUCntl = 4'b0110;
            end
            4'b1010: begin // Case 11
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b1100;
            end
            4'b1011: begin // Case 12
                A = 32'h89BCDE34; B = 32'hC53BD687; ALUCntl = 4'b0111;
            end
            4'b1100: begin // Case 13
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b1101;
            end
            4'b1101: begin // Case 14
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b1111;
            end
            4'b1110: begin // Case 15
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b1010;
            end
            4'b1111: begin // Case 16
                A = 32'hF0F03C3C; B = 32'hBF0FF5F5; ALUCntl = 4'b1110;
            end
            default: begin
                A = 32'h00000000; B = 32'h00000000; ALUCntl = 4'b0000;
            end
        endcase
        #3 $display("time=%t A=%8h B=%8h Control=%4b || ALUOut=%8h Zero_flag=%1b Overflow=%1b Carry_out=%1b Negative=%1b", $time, A, B, ALUCntl, ALUOut, Z, V, C, N);
    end
    $finish;
end

endmodule
