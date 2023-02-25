`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 15:56:27
// Design Name: 
// Module Name: Peak_detector
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


module Peak_detector(
    input Clk_20khz,  
    input Rst, 
    input [11:0]mic_in,  
	output  [3:0]volume_level
    );


reg [11:0] Peak_value;
reg [11:0] peak_amplitude;
reg [14:0] sample_count=0;
reg peak_captured=0;

assign volume_level = peak_amplitude/128;

//
//						ADC Code
//	Voltage = ---------------------------- × 3V
//						4096
	
/*Mic input normalization 
//There are 12 bits in mic_in, so the range is 0-4095 or 4096 audio input levels
//We got only 0-15 or 16 volume levels to represents 4096 audio input levels
//4096/256 = 16 ==> Increment of 256 in mic_in is corresponds to a single volume level increment

// mic_in		volume			LED on

// 0-255 		volume 0		LED0
// 256-511 		volume 1		LED0 LED1
// 512-767 		volume 2		LED0 LED1 LED2
// 768-1023 	volume 3		LED0 LED1 LED2	LED3
.	
.	
.	
// 3840-4095	volume 15		LED0 LED1 LED2	LED3 ....... LED15
*/

always @(posedge Clk_20khz or posedge Rst)
    begin
		if(Rst==1)
		begin
			Peak_value 		<= 0;
		end
        else
		begin
			if( mic_in > Peak_value) 
				Peak_value 		<= mic_in;
			else if (peak_captured)
				Peak_value 		<= 0;
		end
	end
		
/// Observe the peak value over 1s and capture it to have smoother variation
// Audio samples are captured at 20Khz
// So, we receive one audio sample (12 bits) every 0.05ms (period of 20Khz)
// 0.05 * 20000 = 1s

	always @(posedge Clk_20khz or posedge Rst)
    begin 
        if(Rst==1)
		begin
            peak_captured		<= 0;
            sample_count		<= 0;
			peak_amplitude 		<= 0;
		end
        else
		begin
			if( sample_count == 15'd10000) // 1s time period
			begin
				peak_captured		<= 1'b1;
				sample_count		<= 0;
				
				if((Peak_value < 12'd2048) || (Peak_value == 12'd4095) ) // setting a threshold of 1.5v in order to nullify any noise; this value is chosen after observing a value of 08 on the display when no input 
					peak_amplitude 		<= 0;
				else
					peak_amplitude		<= Peak_value - 12'd2048; // substracting noise part
			end
			else
			begin
				peak_captured		<= 1'b0;
				sample_count 		<= sample_count + 1;
			end
		end
    end 
	
endmodule
