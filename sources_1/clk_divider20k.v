`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 22:31:09
// Design Name: 
// Module Name: clk_divider20k
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


module clk_divider20k(input clk, output reg clk20k);
    reg [29:0]counter = 0;
    always @(posedge clk)begin
        counter <= (counter >= 4999) ? 0 : counter + 1;
        clk20k <= (counter < 2500) ? 1'b0 : 1'b1;
    end
endmodule
