`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 15:56:27
// Design Name: 
// Module Name: Sevenseg_Controller
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


module Sevenseg_Controller(
    input Clk_100Mhz, 
    input Rst, 
    input [3:0]volume_level, 
	output reg [3:0]an, 
	output reg [7:0]seg
    );


//Seven segment display logic	

reg [19:0] RefreshCnt=0; 	// 20-bit counter used for creating 10.49ms refresh period or 95Hz refresh rate
								// the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
wire [1:0] LedActivateCnt; 	// 0    	->  1  		->  2  		->  3
reg [7:0] seg_digit1;
reg [7:0] seg_digit0;

/*								// DIGIT1    	DIGIT2   	DIGIT3   	DIGIT4
A scanning display controller circuit can be used to show a four-digit number on this display. This circuit drives the
anode signals and corresponding cathode patterns of each digit in a repeating, continuous succession at an update
rate that is faster than the human eye can detect. Each digit is illuminated just one-fourth of the time, but because
the eye cannot perceive the darkening of a digit before it is illuminated again, the digit appears continuously
illuminated. If the update, or "refresh", rate is slowed to around 45Hz, a flicker can be noticed in the display.

For each of the four digits to appear bright and continuously illuminated, all four digits should be driven once every
1 to 16ms, for a refresh frequency of about 1 KHz to 60Hz. For example, in a 62.5Hz refresh scheme, the entire
display would be refreshed once every 16ms, and each digit would be illuminated for 1/4 of the refresh cycle, or
4ms. The controller must drive the cathodes low with the correct pattern when the corresponding anode signal is
driven high. To illustrate the process, if AN0 is asserted while CB and CC are asserted, then a "1" will be displayed
*/

//Refresh count logic
	always @(posedge Clk_100Mhz or posedge Rst)
    begin 
        if(Rst==1)
            RefreshCnt <= 0;
        else
            RefreshCnt <= RefreshCnt + 1;
    end 
	
	//LED activate counter
    assign LedActivateCnt = RefreshCnt[19:18];								
	
//assign an 	= 4'b1100; //AN1 & AN2 ON ; AN3 & AN4 OFF

//seven segment data output
	always @(*)
		begin
			case(LedActivateCnt)
			2'b00: begin
						seg		= seg_digit0;
						an 		= 4'b1110; //activate Digit0 and Deactivate digit1-3
					end
			2'b01: begin
						seg		= seg_digit1;
						an 		= 4'b1101; //activate Digit1 and Deactivate digit0, digit2 & digit3
					end
			2'b10: begin
						an 		= 4'b1111; // all off because digit 2 is not used
					end
			2'b11: begin
						an 		= 4'b1111; // all off because digit 3 is not used
					end
			endcase
		end

// seven segment data selection
	always @ (*)begin
        case(volume_level)
            4'd0:
				begin
					seg_digit1 = 8'b1_0000001;// "0"  {DP,CA,CB,CC,CD,CE,CF,CG}    (Active low)
					seg_digit0 = 8'b1_0000001;// "0"
				end
			4'd1:
				begin
					seg_digit1 = 8'b1_0000001;// "0" 
					seg_digit0 = 8'b1_1001111; //"1"
				end
			4'd2:
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0010010; // "2"
				end
			4'd3: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 =  8'b1_0000110; // "3" 
				end
			4'd4: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 =  8'b1_1001100; // "4" 
				end
			4'd5:
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0100100; // "5" 
				end
			4'd6: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0100000; // "6"
				end
			4'd7: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0001111; // "7"
				end
			4'd8: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0000000; // "8"
				end
			4'd9: 
				begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0000100; // "9"
				end
			4'd10: 
				begin
					seg_digit1 = 8'b1_1001111;// "1" 
					seg_digit0 = 8'b1_0000001; //"0"
				end
			4'd11: 
				begin
					seg_digit1 = 8'b1_1001111;	// "1"
					seg_digit0 = 8'b1_1001111; // "1"
				end
			4'd12: 
				begin
					seg_digit1 = 8'b1_1001111;	// "1"
					seg_digit0 = 8'b1_0010010; // "2"
				end 
			4'd13: 
				begin
					seg_digit1 = 8'b1_1001111;	// "1"
					seg_digit0 = 8'b1_0000110; // "3"
				end
			4'd14: 
				begin
					seg_digit1 = 8'b1_1001111;	// "1"
					seg_digit0 = 8'b1_1001100; // "4"
				end 
			4'd15: 
				begin
					seg_digit1 = 8'b1_1001111;	// "1"
					seg_digit0 = 8'b1_0100100; // "5"
				end
            default:
              begin
					seg_digit1 = 8'b1_0000001;	// "0"
					seg_digit0 = 8'b1_0000001; // "0"
				end
            
       endcase
	end

endmodule
