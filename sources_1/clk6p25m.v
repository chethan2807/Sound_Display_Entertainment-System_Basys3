`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2020 16:20:43
// Design Name: 
// Module Name: clk6p25m
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


module clk6p25m(input clk, output reg slow_clock);
    reg[3:0]counter = 0;
    always @(posedge clk)begin
        counter <= (counter >= 15) ? 0 : counter + 1;
        slow_clock <= (counter < 8) ? 1'b0 : 1'b1;
    end
endmodule
