`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 15:56:27
// Design Name: 
// Module Name: Averager
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


module Averager(
    input Clk_20khz, 
    input Rst, 
    input [11:0]mic_in,  
	output reg [11:0]avg_audio_data
    );


// 1Khz clock generator	
  reg [4:0]counter = 0;
  reg clk_2Khz;
    always @(posedge Clk_20khz)begin
        counter <= (counter >= 10) ? 0 : counter + 1;
        clk_2Khz <= (counter < 5) ? 1'b0 : 1'b1;
    end
//

//Averaging logic 
// 1 bit audio input period is 0.05ms which is period of 20Khz
// 12 bits take 0.6ms to captured. 12*0.05ms = 0.6ms
// So, we receive one sample of audio input (12 bits) every 0.6ms
// Let's average over 1s  to make it smoother

reg [22:0] sum_data =0;// sum of samples over 1s which 1000 samples
reg [10:0] sample_count=0;


always @(posedge Clk_20khz or posedge Rst)
    begin
		if(Rst==1)
            avg_audio_data	 <= 0;
        else
			if (sample_count==10'd2000)
				avg_audio_data <= sum_data/2000;
	end
		

	always @(posedge clk_2Khz or posedge Rst)
    begin 
        if(Rst==1)
		begin
            sum_data	 <= 0;
            sample_count <= 0;
		end
        else
		begin
			if( sample_count < 11'd2000) 
			begin
				sum_data 	 <= sum_data + mic_in;
				sample_count <= sample_count + 1;
			end
			else
			begin
				sum_data 	 <= 23'd0;
				sample_count <= 11'd0;
			end
		end
    end 
	
	

endmodule
