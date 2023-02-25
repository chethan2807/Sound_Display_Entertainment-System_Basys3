`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2020 19:54:04
// Design Name: 
// Module Name: Volume_Bar_Gen
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


module Volume_Bar_Gen(
    input [12:0] pixel_index,  
    input [3:0] volume_level_in,  
	output reg [15:0] oled_data,
	input [15:0]sw
    );

    //Parameter delcarations   
    localparam Width = 96;
    localparam Height = 64;
    localparam PixelCount = Width * Height;
    localparam PixelCountWidth = $clog2(PixelCount);
    
    
    wire WB_TOP,WB_BOTTOM, WB_LEFT, WB_RIGHT, WB; //WB(white border)
    wire GB1, GB2, GB3, GB4, GB5, GB6, GB; // green bar
    wire YB1, YB2, YB3, YB4, YB5, YB; // yellow bar
    wire RB1, RB2, RB3, RB4, RB5, RB; // red bar
    wire En_Volume_Bar;
    wire En_GB1_H, En_GB2_H, En_GB3_H, En_GB4_H, En_GB5_H, En_GB6_H;
    wire En_YB1_H, En_YB2_H, En_YB3_H, En_YB4_H, En_YB5_H;
    wire En_RB1_H, En_RB2_H, En_RB3_H, En_RB4_H, En_RB5_H;
    wire En_GB1_V, En_GB2_V, En_GB3_V, En_GB4_V, En_GB5_V, En_GB6_V;
    wire En_YB1_V, En_YB2_V, En_YB3_V, En_YB4_V, En_YB5_V;
    wire En_RB1_V, En_RB2_V, En_RB3_V, En_RB4_V, En_RB5_V;
	wire [3:0]volume_level;
    
    /*Switch details
    //	sw3		sw2			BAR
    //	0		0			no bar
    //	0		1			1 pixel white bar
    //	1		0			3 pixel white bar
    
    // SW4 
    //	0			no volume bar
    //	1			volume bar
	
	//SW6
	//	0			no freeze
    //	1			freeze
    
    Frame format for 3 pixels white border
    //One frame is 96x64 = 96 pixels and 64 lines
    //First 3 pixels of all the lines should be white to create a white border
    
    Line Numbers								Pixel Numbers
        
    Line 0-2  	: white border					0		:287
    Line 3-7	: Blank							288		:767
    Line 8		: Blank							768		:863
    Line 9-10	: RB5 							864		:1055
    Line 11		: Blank							1056	:1151
    Line 12-13	: RB4 							1152	:1343
    Line 14		: Blank
    Line 15-16	: RB3 
    Line 17		: Blank
    Line 18-19	: RB2 
    Line 20		: Blank
    Line 21-22	: RB1 (Red Bar1)
    Line 23		: Blank
    
    Line 24-25	: YB5 
    Line 26		: Blank
    Line 27-28	: YB4 
    Line 29		: Blank
    Line 30-31	: YB3 
    Line 32		: Blank
    Line 33-34	: YB2 
    Line 35		: Blank
    Line 36-37	: YB1 (Yellow Bar1)
    Line 38		: Blank
    
    Line 39-40	: GB6
    Line 41		: Blank
    Line 42-43	: GB5
    Line 44		: Blank
    Line 45-46	: GB4
    Line 47		: Blank
    Line 48-49	: GB3
    Line 50		: Blank
    Line 51-52	: GB2
    Line 53		: Blank
    Line 54-55	: GB1 (Green Bar1)
    Line 56-60	: Blank
    Line 61-63	: white border
    
    */
	
	assign volume_level = sw[6] ? volume_level : volume_level_in; // freeze logic
    
    
    assign GB1 	= En_GB1_H && En_GB1_V && (volume_level >= 0);
    assign GB2 	= En_GB2_H && En_GB2_V && (volume_level >= 1);
    assign GB3 	= En_GB3_H && En_GB3_V && (volume_level >= 2);
    assign GB4 	= En_GB4_H && En_GB4_V && (volume_level >= 3);
    assign GB5 	= En_GB5_H && En_GB5_V && (volume_level >= 4);
    assign GB6 	= En_GB6_H && En_GB6_V && (volume_level >= 5);
    
    assign GB 	= (GB1 | GB2 | GB3 | GB4 | GB5 | GB6);
    
    assign YB1 	= En_YB1_H && En_YB1_V && (volume_level >= 6);
    assign YB2 	= En_YB2_H && En_YB2_V && (volume_level >= 7);
    assign YB3 	= En_YB3_H && En_YB3_V && (volume_level >= 8);
    assign YB4 	= En_YB4_H && En_YB4_V && (volume_level >= 9);
    assign YB5 	= En_YB5_H && En_YB5_V && (volume_level >= 10);
                  
    assign YB 	= (YB1 | YB2 | YB3 | YB4 | YB5);
    
    assign RB1 	= En_RB1_H && En_RB1_V && (volume_level >= 11);
    assign RB2 	= En_RB2_H && En_RB2_V && (volume_level >= 12);
    assign RB3 	= En_RB3_H && En_RB3_V && (volume_level >= 13);
    assign RB4	= En_RB4_H && En_RB4_V && (volume_level >= 14);
    assign RB5 	= En_RB5_H && En_RB5_V && (volume_level >= 15);
    
    assign RB 	= (RB1 | RB2 | RB3 | RB4 | RB5);
    
    assign WB_TOP 		= (((pixel_index/96) <= 02) && (sw[4:3] == 2'b10)) 	||	(((pixel_index/96) <= 0)  && (sw[4:3] == 2'b01))	;
    assign WB_BOTTOM 	= (((pixel_index/96) >= 61) && (sw[4:3] == 2'b10))	||	(((pixel_index/96) >= 63) && (sw[4:3] == 2'b01))	;
    assign WB_LEFT 		= (((pixel_index%96) <= 02) && (sw[4:3] == 2'b10))	||	(((pixel_index%96) <= 0)  && (sw[4:3] == 2'b01))	;
    assign WB_RIGHT 	= (((pixel_index%96) >= 93) && (sw[4:3] == 2'b10))	||	(((pixel_index%96) >= 95) && (sw[4:3] == 2'b01))	;
    
    assign WB 	= (WB_TOP | WB_BOTTOM | WB_LEFT | WB_RIGHT);
	
//Different volume level representation
	assign En_GB1_H =  sw[7] ? ((pixel_index%96) >= 47)  && ((pixel_index%96) <= 49)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52); // Green bar 1 horizontal pixels enable
	assign En_GB2_H =  sw[7] ? ((pixel_index%96) >= 46)  && ((pixel_index%96) <= 50)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_GB3_H =  sw[7] ? ((pixel_index%96) >= 45)  && ((pixel_index%96) <= 51)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_GB4_H =  sw[7] ? ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_GB5_H =  sw[7] ? ((pixel_index%96) >= 43)  && ((pixel_index%96) <= 53)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_GB6_H =  sw[7] ? ((pixel_index%96) >= 42)  && ((pixel_index%96) <= 54)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	
	assign En_YB1_H =  sw[7] ? ((pixel_index%96) >= 41)  && ((pixel_index%96) <= 55)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52); // Yellow bar 1 horizontal pixels enable
	assign En_YB2_H =  sw[7] ? ((pixel_index%96) >= 40)  && ((pixel_index%96) <= 56)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_YB3_H =  sw[7] ? ((pixel_index%96) >= 39)  && ((pixel_index%96) <= 57)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_YB4_H =  sw[7] ? ((pixel_index%96) >= 38)  && ((pixel_index%96) <= 58)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_YB5_H =  sw[7] ? ((pixel_index%96) >= 37)  && ((pixel_index%96) <= 59)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	
	
	assign En_RB1_H =  sw[7] ? ((pixel_index%96) >= 35)  && ((pixel_index%96) <= 61)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52); // Red bar 1 horizontal pixels enable
	assign En_RB2_H =  sw[7] ? ((pixel_index%96) >= 34)  && ((pixel_index%96) <= 62)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_RB3_H =  sw[7] ? ((pixel_index%96) >= 33)  && ((pixel_index%96) <= 63)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_RB4_H =  sw[7] ? ((pixel_index%96) >= 32)  && ((pixel_index%96) <= 64)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	assign En_RB5_H =  sw[7] ? ((pixel_index%96) >= 31)  && ((pixel_index%96) <= 65)	: ((pixel_index%96) >= 44)  && ((pixel_index%96) <= 52);
	


	assign En_GB1_V =  (((pixel_index/96) == 54) || ((pixel_index/96) == 55)) ; // Green bar 1 vertical pixels enable
	assign En_GB2_V =  sw[7] ? (((pixel_index/96) == 52) || ((pixel_index/96) == 53)) : (((pixel_index/96) == 51) || ((pixel_index/96) == 52));
	assign En_GB3_V =  sw[7] ? (((pixel_index/96) == 50) || ((pixel_index/96) == 51)) : (((pixel_index/96) == 48) || ((pixel_index/96) == 49));
	assign En_GB4_V =  sw[7] ? (((pixel_index/96) == 48) || ((pixel_index/96) == 49)) : (((pixel_index/96) == 45) || ((pixel_index/96) == 46));
	assign En_GB5_V =  sw[7] ? (((pixel_index/96) == 46) || ((pixel_index/96) == 47)) : (((pixel_index/96) == 42) || ((pixel_index/96) == 43));
	assign En_GB6_V =  sw[7] ? (((pixel_index/96) == 44) || ((pixel_index/96) == 45)) : (((pixel_index/96) == 39) || ((pixel_index/96) == 40));
  
	assign En_YB1_V =  sw[7] ? (((pixel_index/96) == 42) || ((pixel_index/96) == 43)) : (((pixel_index/96) == 36) || ((pixel_index/96) == 37)); // Yellow bar 1 vertical pixels enable
	assign En_YB2_V =  sw[7] ? (((pixel_index/96) == 40) || ((pixel_index/96) == 41)) : (((pixel_index/96) == 33) || ((pixel_index/96) == 34));
	assign En_YB3_V =  sw[7] ? (((pixel_index/96) == 38) || ((pixel_index/96) == 39)) : (((pixel_index/96) == 30) || ((pixel_index/96) == 31));
	assign En_YB4_V =  sw[7] ? (((pixel_index/96) == 36) || ((pixel_index/96) == 37)) : (((pixel_index/96) == 27) || ((pixel_index/96) == 28));
	assign En_YB5_V =  sw[7] ? (((pixel_index/96) == 34) || ((pixel_index/96) == 35)) : (((pixel_index/96) == 24) || ((pixel_index/96) == 25));
	
	assign En_RB1_V =  sw[7] ? (((pixel_index/96) == 32) || ((pixel_index/96) == 33)) : (((pixel_index/96) == 21) || ((pixel_index/96) == 22)); // Red bar 1 vertical pixels enable
	assign En_RB2_V =  sw[7] ? (((pixel_index/96) == 30) || ((pixel_index/96) == 31)) : (((pixel_index/96) == 18) || ((pixel_index/96) == 19));
	assign En_RB3_V =  sw[7] ? (((pixel_index/96) == 28) || ((pixel_index/96) == 29)) : (((pixel_index/96) == 15) || ((pixel_index/96) == 16));
	assign En_RB4_V =  sw[7] ? (((pixel_index/96) == 26) || ((pixel_index/96) == 27)) : (((pixel_index/96) == 12) || ((pixel_index/96) == 13));
	assign En_RB5_V =  sw[7] ? (((pixel_index/96) == 24) || ((pixel_index/96) == 25)) : (((pixel_index/96) == 09) || ((pixel_index/96) == 10));


    
    always @(*)
        begin
            //Colour 1
            if(sw[2])
            begin
                if(WB)
                    oled_data 		<= 16'hFFFF;
                else if (GB)
                    oled_data 		<= 16'h07E0;
                else if (YB)
                    oled_data 		<= 16'hFFE0;
                else if (RB)
                    oled_data 		<= 16'hF800;
                else
                    oled_data 		<= 0;
            end
            //Colour 2
            else if(sw[5])
            begin
                if(WB)
                    oled_data         <= 16'h0000;
                else if (GB)
                    oled_data         <= 16'h005F;
                else if (YB)
                    oled_data         <= 16'hFD00;
                else if (RB)
                    oled_data         <= 16'h07E7;
                else
                    oled_data         <= 16'hFFFF;
            end
            //When none of the switch is on.     
            else
                oled_data 		<= 0;
        end
    
//        if(sw[6])
//        begin
//            if(WB)
//                oled_data         <= 16'hFFFF;
//            else if (GB)
//                oled_data         <= 16'h07E0;
//            else if (YB)
//                oled_data         <= 16'hFFE0;
//            else if (RB)
//                oled_data         <= 16'hF800;
//            else
//                oled_data         <= 0;
//        end
//        else
//            oled_data         <= 0;
//	end

	
endmodule
