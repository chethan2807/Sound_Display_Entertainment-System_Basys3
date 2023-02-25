`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,   // Connect to this signal from Audio_Capture.v
    output [15:0]led,     // Connect all 16 leds
    output [3:0]an,      //Connect all the anodes
    output [7:0]seg,     // Connect all 7 segments
    input [15:0]sw,
    //OLED inputs and outputs
    input clk,
    input push_button,
    output [7:0]JB
    );
   

//Parameter delcarations   
    localparam Width = 96;
    localparam Height = 64;
    localparam PixelCount = Width * Height;
    localparam PixelCountWidth = $clog2(PixelCount);
 
//Signal declarations 
    wire clk20k;
    wire [11:0]mic_in;
    wire [3:0]volume_level;
  
    wire reset;
    wire frame_begin, sending_pixels, sample_pixel, cs, sdin, sclk, d_cn, resn, vccen, pmoden;
    wire [4:0]teststate;
    wire [PixelCountWidth-1:0] pixel_index;
    wire slow_clock;
    wire A1, A2, A2_INV;
	wire [15:0]oled_data; //R[15:11]; G[10:5]; B[4:0]
						  
	
	assign A2_INV = ~A2;
    assign reset = (A1 & A2_INV);
     
   
// instantiate Clock generators
	clk_divider20k inst_clk_divider20k(	clk,
										clk20k
										);
										
	clk6p25m inst_clk6p25m(	clk, 
							slow_clock
							);
							
//Reset debounce circuit
	my_dff dev1(slow_clock, push_button, A1);
    my_dff dev2(slow_clock, A1, A2);
	
// OLED module instantiate	
	
   Oled_Display dut(slow_clock, reset, 
            frame_begin, sending_pixels, sample_pixel, 
            pixel_index, oled_data[15:0],
            JB[0], JB[1], JB[3], JB[4], JB[5], JB[6], JB[7], teststate[4:0]);
			
//Volume bar generator
	Volume_Bar_Gen inst_Volume_Bar_Gen(
			pixel_index,  
			volume_level,  
			oled_data,
			sw
		);
			
// Audio capture module instantiate
	
	Audio_Capture mic1(clk,clk20k,J_MIC3_Pin3,J_MIC3_Pin1,J_MIC3_Pin4,mic_in);

// Peak detector

	Peak_detector inst_Peak_detector(
		clk20k,
		reset, 
		mic_in,  
		volume_level
    );

//LED module
	Led_Controller inst_Led_Controller(
		sw[0],
		volume_level, 
		led
    );

//SEVEN segment module

	Sevenseg_Controller inst_Sevenseg_Controller(
		clk, 
		reset, 	
		volume_level, 			
		an, 
		seg
    );	


endmodule
