`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 15:56:27
// Design Name: 
// Module Name: Led_Controller
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


module Led_Controller(
    input led_data_sw,  //SW0 Switch LED data between peak intensity (volume) and the actual volume
    input [3:0]volume_level,  
    output[15:0] led_out
    );
	
reg [15:0]led_data;	


//assign led_out = led_data_sw ? 16'b1111_1111_1111_1111 : led_data;
assign led_out = led_data;
	
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

	always @ (*)begin
        case(volume_level)
            4'd0: 
				led_data = 16'b0000_0000_0000_0001; //only LED0 on
			4'd1: 
				led_data = 16'b0000_0000_0000_0011; //only LED0 & LED1 on
			4'd2: 
				led_data = 16'b0000_0000_0000_0111; //only LED0, LED1 & LED2 on
			4'd3: 
				led_data = 16'b0000_0000_0000_1111; 
			4'd4: 
				led_data = 16'b0000_0000_0001_1111; 
			4'd5: 
				led_data = 16'b0000_0000_0011_1111; 
			4'd6: 
				led_data = 16'b0000_0000_0111_1111; 
			4'd7: 
				led_data = 16'b0000_0000_1111_1111; 
			4'd8: 
				led_data = 16'b0000_0001_1111_1111; 
			4'd9: 
				led_data = 16'b0000_0011_1111_1111; 
			4'd10: 
				led_data = 16'b0000_0111_1111_1111;
			4'd11: 
				led_data = 16'b0000_1111_1111_1111; 
			4'd12: 
				led_data = 16'b0001_1111_1111_1111; 
			4'd13: 
				led_data = 16'b0011_1111_1111_1111; 
			4'd14: 
				led_data = 16'b0111_1111_1111_1111; 
			4'd15: 
				led_data = 16'b1111_1111_1111_1111;  // All the LEDs on
            default:begin
              led_data = 16'b0000_0000_0000_0001; //only LED0 on
            end
       endcase
	end

endmodule
