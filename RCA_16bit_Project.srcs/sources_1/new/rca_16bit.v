`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2026 11:55:44
// Design Name: 
// Module Name: rca_16bit
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


module rca_16bit(
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire [16:0] C;
    assign C[0] = Cin;

    genvar i;
    generate
        for(i = 0; i < 16; i = i + 1) begin
            assign Sum[i] = A[i] ^ B[i] ^ C[i];
            assign C[i+1] = (A[i] & B[i]) | (B[i] & C[i]) | (A[i] & C[i]);
        end
    endgenerate

    assign Cout = C[16];

endmodule

