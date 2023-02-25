`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2020 23:15:12
// Design Name: 
// Module Name: Game_Play
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


module Game_Play(
    input clk, 
	input clk_20Khz, // slow clock
    input Rst,
    input [12:0] pixel_index,  
    input [3:0] volume_level_in,  
	output reg [15:0]oled_data,
	input [15:0]sw
    );
    localparam Width = 96;
    localparam Height = 64;
    localparam PixelCount = Width * Height;
    localparam PixelCountWidth = $clog2(PixelCount);
    
    reg initial_begin = 0;
    reg [3:0]random_generate = 1;
    wire [3:0]volume_level;
    assign volume_level =  volume_level_in;
    
    //Start page###########################################################################################
    wire shout, legend, clap, to, start;
    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26;
    wire l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24;
    wire clap1, clap2, clap3, clap4, clap5, clap6, clap7, clap8, clap9, clap10, clap11, clap12, clap13;
    wire to1, to2, to3, to4, to5, to6;
    wire start1, start2, start3, start4, start5, start6, start7, start8, start9, start10, start11, start12, start13, start14, start15, start16, start17, start18, start19;
    
    assign s1 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 16);
    assign s2 = ((pixel_index%96) == 1 && (pixel_index/96) >= 17 && (pixel_index/96) <= 24);
    assign s3 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 25);
    assign s4 = ((pixel_index%96) == 5 && (pixel_index/96) >= 26 && (pixel_index/96) <= 34);
    assign s5 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 35);
    assign s6 = ((pixel_index%96) == 8 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s7 = ((pixel_index%96) >= 9 && (pixel_index%96) <= 12 && (pixel_index/96) == 25);
    assign s8 = ((pixel_index%96) == 12 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s9 = ((pixel_index%96) == 15 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s10 = ((pixel_index%96) >= 16 && (pixel_index%96) <= 18 && (pixel_index/96) == 16);
    assign s11 = ((pixel_index%96) >= 16 && (pixel_index%96) <= 18 && (pixel_index/96) == 35);
    assign s12 = ((pixel_index%96) == 19 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35); 
    assign s13 = ((pixel_index%96) == 22 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s14 = ((pixel_index%96) >= 23 && (pixel_index%96) <= 25 && (pixel_index/96) == 35);
    assign s15 = ((pixel_index%96) == 26 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s16 = ((pixel_index%96) >= 29 && (pixel_index%96) <= 33 && (pixel_index/96) == 16);
    assign s17 = ((pixel_index%96) == 31 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s18 = ((pixel_index%96) == 36 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s19 = ((pixel_index%96) == 39 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s20 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 16);
    assign s21 = ((pixel_index%96) == 43 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s22 = ((pixel_index%96) == 46 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign s23 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 50 && (pixel_index/96) == 16);
    assign s24 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 50 && (pixel_index/96) == 35);
    assign s25 = ((pixel_index%96) == 50 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
    assign s26 = ((pixel_index%96) >= 48 && (pixel_index%96) <= 50 && (pixel_index/96) == 25);
    
    assign l1 = ((pixel_index%96) == 56 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l2 = ((pixel_index%96) >= 56 && (pixel_index%96) <= 60 && (pixel_index/96) == 35);
    assign l3 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l4 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 16);
    assign l5 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 25);
    assign l6 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 35);
    assign l7 = ((pixel_index%96) == 70 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l8 = ((pixel_index%96) >= 70 && (pixel_index%96) <= 74 && (pixel_index/96) == 16);
    assign l9 = ((pixel_index%96) >= 70 && (pixel_index%96) <= 74 && (pixel_index/96) == 35);
    assign l10 = ((pixel_index%96) == 74 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
    assign l11 = ((pixel_index%96) >= 72 && (pixel_index%96) <= 74 && (pixel_index/96) == 25);
    assign l12 = ((pixel_index%96) == 77 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l13 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 16);
    assign l14 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 25);
    assign l15 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 35);
    assign l16 = ((pixel_index%96) == 84 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l17 = ((pixel_index%96) >= 85 && (pixel_index%96) <= 87 && (pixel_index/96) == 16);
    assign l18 = ((pixel_index%96) == 88 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l19 = ((pixel_index%96) == 91 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign l20 = ((pixel_index%96) >= 92 && (pixel_index%96) <= 93 && (pixel_index/96) == 16);
    assign l21 = ((pixel_index%96) >= 92 && (pixel_index%96) <= 93 && (pixel_index/96) == 35);
    assign l22 = ((pixel_index%96) == 94 && (pixel_index/96) == 17);
    assign l23 = ((pixel_index%96) == 94 && (pixel_index/96) == 34);
    assign l24 = ((pixel_index%96) == 95 && (pixel_index/96) >= 18 && (pixel_index/96) <= 33);
       
    assign shout = (s1||s2||s3||s4||s5||s6||s7||s8||s9||s10||s11||s12||s13||s14||s15||s16||s17||s18||s19||s20||
                    s21||s22||s23||s24||s25||s26);
    assign legend = (l1||l2||l3||l4||l5||l6||l7||l8||l9||l10||l11||l12||l13||l14||l15||l16||l17||l18||l19||l20||
                    l21||l22||l23||l24);
    
    assign clap1 =  ((pixel_index%96) == 15 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
    assign clap2 =  ((pixel_index%96) >= 16 && (pixel_index%96) <= 18  && (pixel_index/96) == 45);
    assign clap3 =  ((pixel_index%96) >= 16 && (pixel_index%96) <= 18  && (pixel_index/96) == 50);
    assign clap4 =  ((pixel_index%96) == 20 && (pixel_index/96) >= 45 && pixel_index/96 <= 50);
    assign clap5 =  ((pixel_index%96) >= 21 && (pixel_index%96) <= 23 && (pixel_index/96) == 50);
    assign clap6 =  ((pixel_index%96) == 25 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign clap7 =  ((pixel_index%96) >= 26 && (pixel_index%96) <= 27 && pixel_index/96 == 45);
    assign clap8 =  ((pixel_index%96) >= 26 && (pixel_index%96) <= 27 && pixel_index/96 == 47);
    assign clap9 =  ((pixel_index%96) == 28 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign clap10 =  ((pixel_index%96) == 30 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign clap11 =  ((pixel_index%96) >= 31 && (pixel_index%96) <= 32 && pixel_index/96 == 45);
    assign clap12 =  ((pixel_index%96) >= 31 && (pixel_index%96) <= 32 && pixel_index/96 == 47);
    assign clap13 =  ((pixel_index%96) == 33 && pixel_index/96 >= 45 && pixel_index/96 <= 47);
    
    assign to1 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 44  && (pixel_index/96) == 45);
    assign to2 = ((pixel_index%96) == 42 && (pixel_index/96) >= 46 && (pixel_index/96) <= 50);
    assign to3 = ((pixel_index%96) == 46 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
    assign to4 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 48 && (pixel_index/96) == 45);
    assign to5 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 48 && (pixel_index/96) == 50);
    assign to6 = ((pixel_index%96) == 49 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
    
    assign start1 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 45);
    assign start2 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 47);
    assign start3 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 50);
    assign start4 =  ((pixel_index%96) == 55 && (pixel_index/96) == 46);
    assign start5 =  ((pixel_index%96) == 58 && (pixel_index/96) >= 48 && pixel_index/96 <= 49);
    assign start6 =  ((pixel_index%96) >= 60 && (pixel_index%96) <= 64 && pixel_index/96 == 45);
    assign start7 =  ((pixel_index%96) == 62 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign start8 =  ((pixel_index%96) == 66 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign start9 =  ((pixel_index%96) >= 67 && (pixel_index%96) <= 68 && pixel_index/96 == 45);
    assign start10 =  ((pixel_index%96) >= 67 && (pixel_index%96) <= 68 && pixel_index/96 == 47);
    assign start11 =  ((pixel_index%96) == 69 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign start12 =  ((pixel_index%96) == 71 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign start13 =  ((pixel_index%96) >= 72 && (pixel_index%96) <= 73 && pixel_index/96 == 45);
    assign start14 =  ((pixel_index%96) >= 72 && (pixel_index%96) <= 73 && pixel_index/96 == 47);
    assign start15 =  ((pixel_index%96) == 74 && pixel_index/96 >= 45 && pixel_index/96 <= 47);
    assign start16 =  ((pixel_index%96) == 73 && (pixel_index/96) >= 48 && pixel_index/96 <= 49);
    assign start17 =  ((pixel_index%96) == 74 && pixel_index/96 == 50);
    assign start18 =  ((pixel_index%96) >= 76 && (pixel_index%96) <= 80 && pixel_index/96 == 45);
    assign start19 =  ((pixel_index%96) == 78 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
    assign clap = (clap1 || clap2 || clap3 || clap4 || clap5 || clap6 || clap7 || clap8 || clap9 || clap10 || clap11 || clap12 || clap13);
    assign to = (to1 || to2 || to3 || to4 || to5 || to6);
    assign start = (start1||start2||start3||start4||start5||start6||start7||start8||start9||start10||
                    start11||start12||start13||start14||start15||start16||start17||start18||start19);
                    
    //Number Display####################################################################################
    wire one, two, three, four, five, six, seven, eight, nine, ten, elev, tw, thirt, fourt, fifth;
    wire one1, one2, one3, one4, one5, one6, one7;
    wire two1, two2, two3, two4, two5;
    wire three1, three2, three3, three4, three5;
    wire four1, four2, four3;
    wire five1, five2, five3, five4, five5;
    wire six1, six2, six3, six4, six5, six6;
    wire seven1, seven2;
    wire eight1, eight2, eight3, eight4, eight5, eight6, eight7;
    wire nine1, nine2, nine3, nine4, nine5, nine6;
    wire ten1, ten2, ten3, ten4, ten5, ten6, ten7, ten8, ten9, ten10;
    wire elev1, elev2, elev3, elev4, elev5, elev6, elev7, elev8, elev9, elev10, elev11, elev12;
    wire tw1, tw2, tw3, tw4, tw5, tw6, tw7, tw8, tw9, tw10, tw11;
    wire thirt1, thirt2, thirt3, thirt4, thirt5, thirt6, thirt7, thirt8, thirt9, thirt10, thirt11;
    wire fourt1, fourt2, fourt3, fourt4, fourt5, fourt6, fourt7, fourt8, fourt9;
    wire fifth1, fifth2, fifth3, fifth4, fifth5, fifth6, fifth7, fifth8, fifth9, fifth10, fifth11;
    
    //One
    assign one1 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 48  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign one2 = ((pixel_index%96) >= 43 && (pixel_index%96) <= 45  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign one3 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 51  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign one4 = ((pixel_index%96) >= 43 && (pixel_index%96) <= 45  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign one5 = ((pixel_index%96) == 44 && (pixel_index/96) == 9);
    assign one6 = ((pixel_index%96) == 45 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign one = (one1 || one2 || one3 || one4 || one5 || one6 || one7);
    //Two
    assign two1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign two2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign two3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign two4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign two5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign two = (two1 || two2 || two3 || two4 || two5);
    //Three
    assign three1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign three2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign three3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign three4 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign three5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign three = (three1 || three2 || three3 || three4 || three5);
    //Four
    assign four1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 8 && (pixel_index/96) <= 32);
    assign four2 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 60  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign four3 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign four = (four1 || four2 || four3);
    //Five
    assign five1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign five2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign five3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign five4 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign five5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign five = (five1 || five2 || five3 || five4 || five5);
    //Six
    assign six1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign six2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign six3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign six4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign six5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign six6 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign six = (six1 || six2 || six3 || six4 || six5 || six6);
    //Seven
    assign seven1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign seven2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 55);
    assign seven = (seven1 || seven2);
    //Eight
    assign eight1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign eight2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign eight3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign eight4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign eight5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign eight6 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign eight7 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign eight = (eight1 || eight2 || eight3 || eight4 || eight5 || eight6 || eight7);
    //Nine
    assign nine1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign nine2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign nine3 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign nine4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign nine5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign nine6 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign nine = (nine1 || nine2 || nine3 || nine4 || nine5 || nine6);
    //Ten
    assign ten1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign ten2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign ten3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign ten4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign ten5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
    assign ten6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign ten7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign ten8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign ten9 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign ten10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign ten = (ten1 || ten2 || ten3 || ten4 || ten5 || ten6 || ten7 || ten8 || ten9 || ten10);
    //Elev
    assign elev1 = ((pixel_index%96) >= 38 && (pixel_index%96) <= 40  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign elev2 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 37  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign elev3 = ((pixel_index%96) >= 41 && (pixel_index%96) <= 43  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign elev4 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 37  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign elev5 = ((pixel_index%96) == 36 && (pixel_index/96) == 9);
    assign elev6 = ((pixel_index%96) == 37 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign elev7 = ((pixel_index%96) >= 53 && (pixel_index%96) <= 55  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign elev8 = ((pixel_index%96) >= 50 && (pixel_index%96) <= 52  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign elev9 = ((pixel_index%96) >= 56 && (pixel_index%96) <= 58  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign elev10 = ((pixel_index%96) >= 50 && (pixel_index%96) <= 52  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign elev11 = ((pixel_index%96) == 51 && (pixel_index/96) == 9);
    assign elev12 = ((pixel_index%96) == 52 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign elev = (elev1 || elev2 || elev3 || elev4 || elev5 || elev6 || elev7 || elev8 || elev9 || elev10 || elev11 || elev12);
    //Twlv
    assign tw1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign tw2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign tw3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign tw4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign tw5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
    assign tw6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign tw7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign tw8 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign tw9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign tw10 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign tw11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign tw = (tw1 || tw2 || tw3 || tw4 || tw5 || tw6 || tw7 || tw8 || tw9 || tw10 || tw11);
    //Thirt
    assign thirt1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign thirt2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign thirt3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign thirt4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign thirt5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
    assign thirt6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign thirt7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign thirt8 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign thirt9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign thirt10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign thirt11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign thirt = (thirt1 || thirt2 || thirt3 || thirt4 || thirt5 || thirt6 || thirt7 || thirt8 || thirt9 || thirt10 || thirt11);
    //Fourt
    assign fourt1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign fourt2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign fourt3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign fourt4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign fourt5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
    assign fourt6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign fourt7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 8 && (pixel_index/96) <= 32);
    assign fourt8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign fourt9 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign fourt = (fourt1 || fourt2 || fourt3 || fourt4 || fourt5 || fourt6 || fourt7 || fourt8 || fourt9);
    //Fifth
    assign fifth1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
    assign fifth2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign fifth3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign fifth4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
    assign fifth5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
    assign fifth6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
    assign fifth7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
    assign fifth8 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
    assign fifth9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
    assign fifth10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
    assign fifth11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
    assign fifth = (fifth1 || fifth2 || fifth3 || fifth4 || fifth5 || fifth6 || fifth7 || fifth8 || fifth9 || fifth10 || fifth11);
    
    //Unlock stages
    wire amateur, pro, legen;
    wire am1,am2,am3,am4,am5,am6,am7,am8,am9,am10,am11,am12,am13,am14,am15,am16,am17,am18,am19,am20,
         am21,am22,am23,am24,am25,am26,am27,am28,am29,am30,am31;
    wire pro1,pro2,pro3,pro4,pro5,pro6,pro7,pro8,pro9,pro10,pro11,pro12,pro13,pro14,pro15,pro16;
    wire leg1,leg2,leg3,leg4,leg5,leg6,leg7,leg8,leg9,leg10,leg11,leg12,leg13,leg14,leg15,leg16,leg17,leg18,leg19,leg20,leg21,leg22,leg23,leg24;
    
    assign am1 = ((pixel_index%96) == 24 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am2 = ((pixel_index%96) >= 25 && (pixel_index%96) <= 27 && (pixel_index/96) == 16);
    assign am3 = ((pixel_index%96) >= 25 && (pixel_index%96) <= 27 && (pixel_index/96) == 25);
    assign am4 = ((pixel_index%96) == 28 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
    assign am5 = ((pixel_index%96) == 31 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am6 = ((pixel_index%96) == 32 && (pixel_index/96) == 16);
    assign am7 = ((pixel_index%96) == 33 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am8 = ((pixel_index%96) == 34 && (pixel_index/96) == 16);
    assign am9 = ((pixel_index%96) == 35 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
    assign am10 = ((pixel_index%96) == 38 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am12 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41 && (pixel_index/96) == 16);
    assign am13 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41 && (pixel_index/96) == 25);
    assign am14 = ((pixel_index%96) == 42 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
    assign am15 = ((pixel_index%96) >= 45 && (pixel_index%96) <= 49 && (pixel_index/96) == 16);
    assign am16 = ((pixel_index%96) == 47 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
    assign am17 = ((pixel_index%96) == 52 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am18 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 16);
    assign am19 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 25);
    assign am20 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 35);
    
    assign am21 = ((pixel_index%96) == 59 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am22 = ((pixel_index%96) >= 60 && (pixel_index%96) <= 62 && (pixel_index/96) == 35);
    assign am23 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
    assign am24 = ((pixel_index%96) == 66 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign am25 = ((pixel_index%96) >= 67 && (pixel_index%96) <= 69 && (pixel_index/96) == 16);
    assign am26 = ((pixel_index%96) >= 67 && (pixel_index%96) <= 69 && (pixel_index/96) == 25);
    assign am27 = ((pixel_index%96) == 70 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
    assign am28 = ((pixel_index%96) == 67 && (pixel_index/96) == 26);
    assign am29 = ((pixel_index%96) == 68 && (pixel_index/96) == 27);
    assign am30 = ((pixel_index%96) == 69 && (pixel_index/96) == 28);
    assign am31 = ((pixel_index%96) == 70 && (pixel_index/96) >= 29 && (pixel_index/96) <= 35);
    assign amateur = (am1||am2||am3||am4||am5||am6||am7||am8||am9||am10||
                      am11||am12||am13||am14||am15||am16||am17||am18||am19||am20||
                      am21||am22||am23||am24||am25||am26||am27||am28||am29||am30||am31);
    
    assign pro1 = ((pixel_index%96) == 39 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign pro2 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 16);
    assign pro3 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 25);
    assign pro4 = ((pixel_index%96) == 43 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
    assign pro5 = ((pixel_index%96) == 46 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign pro6 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 49 && (pixel_index/96) == 16);
    assign pro7 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 49 && (pixel_index/96) == 25);
    assign pro8 = ((pixel_index%96) == 50 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
    assign pro9 = ((pixel_index%96) == 47 && (pixel_index/96) == 26);
    assign pro10 = ((pixel_index%96) == 48 && (pixel_index/96) == 27);
    assign pro11 = ((pixel_index%96) == 49 && (pixel_index/96) == 28);
    assign pro12 = ((pixel_index%96) == 50 && (pixel_index/96) >= 29 && (pixel_index/96) <= 35);
    assign pro13 = ((pixel_index%96) == 53 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign pro14 = ((pixel_index%96) >= 54 && (pixel_index%96) <= 56 && (pixel_index/96) == 16);
    assign pro15 = ((pixel_index%96) >= 54 && (pixel_index%96) <= 56 && (pixel_index/96) == 35);
    assign pro16 = ((pixel_index%96) == 57 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign pro = (pro1||pro2||pro3||pro4||pro5||pro6||pro7||pro8||pro9||pro10||
                  pro11||pro12||pro13||pro14||pro15||pro16);
    
    assign leg1 = ((pixel_index%96) == 28 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg2 = ((pixel_index%96) >= 28 && (pixel_index%96) <= 32 && (pixel_index/96) == 35);
    assign leg3 = ((pixel_index%96) == 35 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg4 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 16);
    assign leg5 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 25);
    assign leg6 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 35);
    assign leg7 = ((pixel_index%96) == 42 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 46 && (pixel_index/96) == 16);
    assign leg9 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 46 && (pixel_index/96) == 35);
    assign leg10 = ((pixel_index%96) == 46 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
    assign leg11 = ((pixel_index%96) >= 44 && (pixel_index%96) <= 46 && (pixel_index/96) == 25);
    assign leg12 = ((pixel_index%96) == 49 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg13 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 16);
    assign leg14 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 25);
    assign leg15 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 35);
    assign leg16 = ((pixel_index%96) == 56 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg17 = ((pixel_index%96) >= 57 && (pixel_index%96) <= 59 && (pixel_index/96) == 16);
    assign leg18 = ((pixel_index%96) == 60 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg19 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    assign leg20 = ((pixel_index%96) >= 64 && (pixel_index%96) <= 65 && (pixel_index/96) == 16);
    assign leg21 = ((pixel_index%96) >= 64 && (pixel_index%96) <= 65 && (pixel_index/96) == 35);
    assign leg22 = ((pixel_index%96) == 66 && (pixel_index/96) == 17);
    assign leg23 = ((pixel_index%96) == 66 && (pixel_index/96) == 34);
    assign leg24 = ((pixel_index%96) == 67 && (pixel_index/96) >= 18 && (pixel_index/96) <= 33);
    assign legen = (leg1||leg2||leg3||leg4||leg5||leg6||leg7||leg8||leg9||leg10||
                    leg11||leg12||leg13||leg14||leg15||leg16||leg17||leg18||leg19||leg20||
                    leg21||leg22||leg23||leg24);
					
					
//Random number generation // it is based on (Linear feedback shift register)
reg[3:0] rand_number=4'hf;
wire feedback = rand_number[0] ^ rand_number[1] ;

always @(posedge clk_20Khz or posedge Rst)
begin
  if (Rst) 
    rand_number <= 4'hf;
  else
    rand_number <= {feedback, rand_number[3:1]} ;
end

 reg [14:0]counter = 0;
 reg clk_1Hz;
 always @(posedge clk_20Khz)begin
     counter <= (counter >= 9999) ? 0 : counter + 1;
     clk_1Hz <= (counter < 5000) ? 1'b0 : 1'b1;
 end

// Game control state machice

//state delcarations   
    localparam idle 			= 0;
    localparam rand_num_disp 	= 1;
    localparam num_hit 			= 2;
    localparam dis_amuteur 		= 3;
    localparam dis_pro 			= 4;
    localparam dis_legend 		= 5;
 
//Signal declarations 
    reg [2:0] game_state;
    reg [5:0] hit_number_cnt;
	reg [3:0] game_number;

	always @ (posedge clk_1Hz, posedge Rst )
	begin
		if(Rst | (!sw[9]))
		begin
			game_state		<= idle; // IDLE state
			hit_number_cnt 	<= 4'h0;
			game_number 	<= 4'h0;
		end
		else if(sw[9])
		begin
			case(game_state)
				idle: //Display SHOUT, LEGEND, CLAP, TO, START and wait for user to clap
					begin
						if(volume_level >= 5)
						begin
							game_state	<= rand_num_disp;
							game_number	<= rand_number; // get the random number at this point
						end
					end
				rand_num_disp:
					begin
						if(volume_level == game_number)
						begin
							hit_number_cnt	<= hit_number_cnt + 1;
							game_state		<= num_hit;
						end
					end
				num_hit:
					begin
						if(hit_number_cnt == 3)
							game_state		<= dis_amuteur;
						else if(hit_number_cnt == 8)
							game_state		<= dis_pro;
						else if(hit_number_cnt == 18)
							game_state		<= dis_legend;
						else
						begin 
							game_number	<= rand_number; // get the random number at this point for next round
							game_state	<= rand_num_disp;
						end
					end
				dis_amuteur: 
					begin
						if(volume_level >= 5)
						begin
							game_state	<= rand_num_disp;
							game_number	<= rand_number; // get the random number at this point
						end
					end
				dis_pro: 
					begin
						if(volume_level >= 5)
						begin
							game_state	<= rand_num_disp;
							game_number	<= rand_number; // get the random number at this point
						end
					end
				dis_legend: 
					begin
						if(volume_level >= 5)
						begin
							game_state		<= idle; // start the game again
							hit_number_cnt <= 4'h0;
							game_number		<= rand_number; // get the random number at this point
						end
					end
				
				default:
					begin
						game_state	<= idle; // start the game again
					end
			endcase
		end
	end
	
	always @ (*)begin
        case(game_state)
            idle:
				begin
					if(volume_level >= 5)
					begin
						oled_data 	<= 16'h0;
					end
					else if (shout )
						oled_data <= 16'h07E0;
					else if (legend )
						oled_data <= 16'hAFE0;
					else if (clap)
						oled_data <= 16'hF800;
					else if (to)
						oled_data <= 16'hFFFF;
					else if (start )
						oled_data <= 16'hFFFF;
					else
						oled_data <= 16'h0;
				end
			rand_num_disp:
				begin
					case(game_number)
					    4'd0:
							oled_data <= 16'h0;
						4'd1:
							begin
								if(one)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd2:
							begin
								if(two)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end 
						4'd3: 
							begin
								if(three)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd4: 
							begin
								if(four)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd5:
							begin
								if(five)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd6: 
							begin  
								if(six)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd7: 
							begin
								if(seven)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd8: 
							begin
								if(eight)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd9:
							begin
								if(nine)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd10: 
							begin
								if(ten)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd11: 
							begin
								if(elev)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd12: 
							begin
								if(tw)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd13: 
							begin
								if(thirt)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd14: 
							begin
								if(fourt)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
						4'd15: 
							begin
								if(fifth)
									oled_data <= 16'hF81F; //Magenta
								else
									oled_data <= 16'h0;
							end
					    default:
					      begin
								oled_data <= 16'h0;
							end 
					endcase
				end
			dis_amuteur:
				begin
					if(amateur)
						oled_data <= 16'h001F; //blue
                    else
                        oled_data <= 16'h0;
				end
			dis_pro:
				begin
					if(pro)
						oled_data <= 16'h07FF; //cyan
                    else
                        oled_data <= 16'h0;
				end
			dis_legend:
				begin
					if(legen)
						oled_data <= 16'h07E0; //green
                    else
                        oled_data <= 16'h0;
				end
            default:
              begin
					oled_data 		<= 16'h0;
				end      
       endcase
	end
endmodule
//module Game_Play(
//    input reset,
//    input [12:0] pixel_index,  
//    input [3:0] volume_level_in,  
//	output reg [15:0]oled_data,
//	input [15:0]sw
//    );
//    localparam Width = 96;
//    localparam Height = 64;
//    localparam PixelCount = Width * Height;
//    localparam PixelCountWidth = $clog2(PixelCount);
    
//    reg initial_begin = 0;
//    reg [3:0]random_generate = 1;
//    wire [3:0]volume_level;
//    assign volume_level =  volume_level_in;
    
//    //Start page###########################################################################################
//    wire shout, legend, clap, to, start;
//    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26;
//    wire l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24;
//    wire clap1, clap2, clap3, clap4, clap5, clap6, clap7, clap8, clap9, clap10, clap11, clap12, clap13;
//    wire to1, to2, to3, to4, to5, to6;
//    wire start1, start2, start3, start4, start5, start6, start7, start8, start9, start10, start11, start12, start13, start14, start15, start16, start17, start18, start19;
    
//    assign s1 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 16);
//    assign s2 = ((pixel_index%96) == 1 && (pixel_index/96) >= 17 && (pixel_index/96) <= 24);
//    assign s3 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 25);
//    assign s4 = ((pixel_index%96) == 5 && (pixel_index/96) >= 26 && (pixel_index/96) <= 34);
//    assign s5 = ((pixel_index%96) >= 1 && (pixel_index%96) <= 5 && (pixel_index/96) == 35);
//    assign s6 = ((pixel_index%96) == 8 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s7 = ((pixel_index%96) >= 9 && (pixel_index%96) <= 12 && (pixel_index/96) == 25);
//    assign s8 = ((pixel_index%96) == 12 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s9 = ((pixel_index%96) == 15 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s10 = ((pixel_index%96) >= 16 && (pixel_index%96) <= 18 && (pixel_index/96) == 16);
//    assign s11 = ((pixel_index%96) >= 16 && (pixel_index%96) <= 18 && (pixel_index/96) == 35);
//    assign s12 = ((pixel_index%96) == 19 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35); 
//    assign s13 = ((pixel_index%96) == 22 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s14 = ((pixel_index%96) >= 23 && (pixel_index%96) <= 25 && (pixel_index/96) == 35);
//    assign s15 = ((pixel_index%96) == 26 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s16 = ((pixel_index%96) >= 29 && (pixel_index%96) <= 33 && (pixel_index/96) == 16);
//    assign s17 = ((pixel_index%96) == 31 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s18 = ((pixel_index%96) == 36 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s19 = ((pixel_index%96) == 39 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s20 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 16);
//    assign s21 = ((pixel_index%96) == 43 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s22 = ((pixel_index%96) == 46 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign s23 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 50 && (pixel_index/96) == 16);
//    assign s24 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 50 && (pixel_index/96) == 35);
//    assign s25 = ((pixel_index%96) == 50 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
//    assign s26 = ((pixel_index%96) >= 48 && (pixel_index%96) <= 50 && (pixel_index/96) == 25);
    
//    assign l1 = ((pixel_index%96) == 56 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l2 = ((pixel_index%96) >= 56 && (pixel_index%96) <= 60 && (pixel_index/96) == 35);
//    assign l3 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l4 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 16);
//    assign l5 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 25);
//    assign l6 = ((pixel_index%96) >= 63 && (pixel_index%96) <= 67 && (pixel_index/96) == 35);
//    assign l7 = ((pixel_index%96) == 70 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l8 = ((pixel_index%96) >= 70 && (pixel_index%96) <= 74 && (pixel_index/96) == 16);
//    assign l9 = ((pixel_index%96) >= 70 && (pixel_index%96) <= 74 && (pixel_index/96) == 35);
//    assign l10 = ((pixel_index%96) == 74 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
//    assign l11 = ((pixel_index%96) >= 72 && (pixel_index%96) <= 74 && (pixel_index/96) == 25);
//    assign l12 = ((pixel_index%96) == 77 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l13 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 16);
//    assign l14 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 25);
//    assign l15 = ((pixel_index%96) >= 77 && (pixel_index%96) <= 81 && (pixel_index/96) == 35);
//    assign l16 = ((pixel_index%96) == 84 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l17 = ((pixel_index%96) >= 85 && (pixel_index%96) <= 87 && (pixel_index/96) == 16);
//    assign l18 = ((pixel_index%96) == 88 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l19 = ((pixel_index%96) == 91 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign l20 = ((pixel_index%96) >= 92 && (pixel_index%96) <= 93 && (pixel_index/96) == 16);
//    assign l21 = ((pixel_index%96) >= 92 && (pixel_index%96) <= 93 && (pixel_index/96) == 35);
//    assign l22 = ((pixel_index%96) == 94 && (pixel_index/96) == 17);
//    assign l23 = ((pixel_index%96) == 94 && (pixel_index/96) == 34);
//    assign l24 = ((pixel_index%96) == 95 && (pixel_index/96) >= 18 && (pixel_index/96) <= 33);
       
//    assign shout = (s1||s2||s3||s4||s5||s6||s7||s8||s9||s10||s11||s12||s13||s14||s15||s16||s17||s18||s19||s20||
//                    s21||s22||s23||s24||s25||s26);
//    assign legend = (l1||l2||l3||l4||l5||l6||l7||l8||l9||l10||l11||l12||l13||l14||l15||l16||l17||l18||l19||l20||
//                    l21||l22||l23||l24);
    
//    assign clap1 =  ((pixel_index%96) == 15 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
//    assign clap2 =  ((pixel_index%96) >= 16 && (pixel_index%96) <= 18  && (pixel_index/96) == 45);
//    assign clap3 =  ((pixel_index%96) >= 16 && (pixel_index%96) <= 18  && (pixel_index/96) == 50);
//    assign clap4 =  ((pixel_index%96) == 20 && (pixel_index/96) >= 45 && pixel_index/96 <= 50);
//    assign clap5 =  ((pixel_index%96) >= 21 && (pixel_index%96) <= 23 && (pixel_index/96) == 50);
//    assign clap6 =  ((pixel_index%96) == 25 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign clap7 =  ((pixel_index%96) >= 26 && (pixel_index%96) <= 27 && pixel_index/96 == 45);
//    assign clap8 =  ((pixel_index%96) >= 26 && (pixel_index%96) <= 27 && pixel_index/96 == 47);
//    assign clap9 =  ((pixel_index%96) == 28 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign clap10 =  ((pixel_index%96) == 30 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign clap11 =  ((pixel_index%96) >= 31 && (pixel_index%96) <= 32 && pixel_index/96 == 45);
//    assign clap12 =  ((pixel_index%96) >= 31 && (pixel_index%96) <= 32 && pixel_index/96 == 47);
//    assign clap13 =  ((pixel_index%96) == 33 && pixel_index/96 >= 45 && pixel_index/96 <= 47);
    
//    assign to1 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 44  && (pixel_index/96) == 45);
//    assign to2 = ((pixel_index%96) == 42 && (pixel_index/96) >= 46 && (pixel_index/96) <= 50);
//    assign to3 = ((pixel_index%96) == 46 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
//    assign to4 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 48 && (pixel_index/96) == 45);
//    assign to5 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 48 && (pixel_index/96) == 50);
//    assign to6 = ((pixel_index%96) == 49 && (pixel_index/96) >= 45 && (pixel_index/96) <= 50);
    
//    assign start1 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 45);
//    assign start2 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 47);
//    assign start3 =  ((pixel_index%96) >= 55 && (pixel_index%96) <= 58  && (pixel_index/96) == 50);
//    assign start4 =  ((pixel_index%96) == 55 && (pixel_index/96) == 46);
//    assign start5 =  ((pixel_index%96) == 58 && (pixel_index/96) >= 48 && pixel_index/96 <= 49);
//    assign start6 =  ((pixel_index%96) >= 60 && (pixel_index%96) <= 64 && pixel_index/96 == 45);
//    assign start7 =  ((pixel_index%96) == 62 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign start8 =  ((pixel_index%96) == 66 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign start9 =  ((pixel_index%96) >= 67 && (pixel_index%96) <= 68 && pixel_index/96 == 45);
//    assign start10 =  ((pixel_index%96) >= 67 && (pixel_index%96) <= 68 && pixel_index/96 == 47);
//    assign start11 =  ((pixel_index%96) == 69 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign start12 =  ((pixel_index%96) == 71 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign start13 =  ((pixel_index%96) >= 72 && (pixel_index%96) <= 73 && pixel_index/96 == 45);
//    assign start14 =  ((pixel_index%96) >= 72 && (pixel_index%96) <= 73 && pixel_index/96 == 47);
//    assign start15 =  ((pixel_index%96) == 74 && pixel_index/96 >= 45 && pixel_index/96 <= 47);
//    assign start16 =  ((pixel_index%96) == 73 && (pixel_index/96) >= 48 && pixel_index/96 <= 49);
//    assign start17 =  ((pixel_index%96) == 74 && pixel_index/96 == 50);
//    assign start18 =  ((pixel_index%96) >= 76 && (pixel_index%96) <= 80 && pixel_index/96 == 45);
//    assign start19 =  ((pixel_index%96) == 78 && pixel_index/96 >= 45 && pixel_index/96 <= 50);
//    assign clap = (clap1 || clap2 || clap3 || clap4 || clap5 || clap6 || clap7 || clap8 || clap9 || clap10 || clap11 || clap12 || clap13);
//    assign to = (to1 || to2 || to3 || to4 || to5 || to6);
//    assign start = (start1||start2||start3||start4||start5||start6||start7||start8||start9||start10||
//                    start11||start12||start13||start14||start15||start16||start17||start18||start19);
                    
//    //Number Display####################################################################################
//    wire one, two, three, four, five, six, seven, eight, nine, ten, elev, tw, thirt, fourt, fifth;
//    wire one1, one2, one3, one4, one5, one6, one7;
//    wire two1, two2, two3, two4, two5;
//    wire three1, three2, three3, three4, three5;
//    wire four1, four2, four3;
//    wire five1, five2, five3, five4, five5;
//    wire six1, six2, six3, six4, six5, six6;
//    wire seven1, seven2;
//    wire eight1, eight2, eight3, eight4, eight5, eight6, eight7;
//    wire nine1, nine2, nine3, nine4, nine5, nine6;
//    wire ten1, ten2, ten3, ten4, ten5, ten6, ten7, ten8, ten9, ten10;
//    wire elev1, elev2, elev3, elev4, elev5, elev6, elev7, elev8, elev9, elev10, elev11, elev12;
//    wire tw1, tw2, tw3, tw4, tw5, tw6, tw7, tw8, tw9, tw10, tw11;
//    wire thirt1, thirt2, thirt3, thirt4, thirt5, thirt6, thirt7, thirt8, thirt9, thirt10, thirt11;
//    wire fourt1, fourt2, fourt3, fourt4, fourt5, fourt6, fourt7, fourt8, fourt9;
//    wire fifth1, fifth2, fifth3, fifth4, fifth5, fifth6, fifth7, fifth8, fifth9, fifth10, fifth11;
    
//    //One
//    assign one1 = ((pixel_index%96) >= 46 && (pixel_index%96) <= 48  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign one2 = ((pixel_index%96) >= 43 && (pixel_index%96) <= 45  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign one3 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 51  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign one4 = ((pixel_index%96) >= 43 && (pixel_index%96) <= 45  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign one5 = ((pixel_index%96) == 44 && (pixel_index/96) == 9);
//    assign one6 = ((pixel_index%96) == 45 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign one = (one1 || one2 || one3 || one4 || one5 || one6 || one7);
//    //Two
//    assign two1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign two2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign two3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign two4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign two5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign two = (two1 || two2 || two3 || two4 || two5);
//    //Three
//    assign three1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign three2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign three3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign three4 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign three5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign three = (three1 || three2 || three3 || three4 || three5);
//    //Four
//    assign four1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 8 && (pixel_index/96) <= 32);
//    assign four2 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 60  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign four3 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign four = (four1 || four2 || four3);
//    //Five
//    assign five1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign five2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign five3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign five4 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign five5 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign five = (five1 || five2 || five3 || five4 || five5);
//    //Six
//    assign six1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign six2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign six3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign six4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign six5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign six6 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign six = (six1 || six2 || six3 || six4 || six5 || six6);
//    //Seven
//    assign seven1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign seven2 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 55);
//    assign seven = (seven1 || seven2);
//    //Eight
//    assign eight1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign eight2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign eight3 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign eight4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign eight5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign eight6 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign eight7 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign eight = (eight1 || eight2 || eight3 || eight4 || eight5 || eight6 || eight7);
//    //Nine
//    assign nine1 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign nine2 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 34  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign nine3 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign nine4 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign nine5 = ((pixel_index%96) >= 61 && (pixel_index%96) <= 63  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign nine6 = ((pixel_index%96) >= 32 && (pixel_index%96) <= 63  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign nine = (nine1 || nine2 || nine3 || nine4 || nine5 || nine6);
//    //Ten
//    assign ten1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign ten2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign ten3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign ten4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign ten5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
//    assign ten6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign ten7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign ten8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign ten9 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign ten10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign ten = (ten1 || ten2 || ten3 || ten4 || ten5 || ten6 || ten7 || ten8 || ten9 || ten10);
//    //Elev
//    assign elev1 = ((pixel_index%96) >= 38 && (pixel_index%96) <= 40  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign elev2 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 37  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign elev3 = ((pixel_index%96) >= 41 && (pixel_index%96) <= 43  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign elev4 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 37  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign elev5 = ((pixel_index%96) == 36 && (pixel_index/96) == 9);
//    assign elev6 = ((pixel_index%96) == 37 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign elev7 = ((pixel_index%96) >= 53 && (pixel_index%96) <= 55  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign elev8 = ((pixel_index%96) >= 50 && (pixel_index%96) <= 52  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign elev9 = ((pixel_index%96) >= 56 && (pixel_index%96) <= 58  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign elev10 = ((pixel_index%96) >= 50 && (pixel_index%96) <= 52  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign elev11 = ((pixel_index%96) == 51 && (pixel_index/96) == 9);
//    assign elev12 = ((pixel_index%96) == 52 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign elev = (elev1 || elev2 || elev3 || elev4 || elev5 || elev6 || elev7 || elev8 || elev9 || elev10 || elev11 || elev12);
//    //Twlv
//    assign tw1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign tw2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign tw3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign tw4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign tw5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
//    assign tw6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign tw7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign tw8 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign tw9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign tw10 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign tw11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign tw = (tw1 || tw2 || tw3 || tw4 || tw5 || tw6 || tw7 || tw8 || tw9 || tw10 || tw11);
//    //Thirt
//    assign thirt1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign thirt2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign thirt3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign thirt4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign thirt5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
//    assign thirt6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign thirt7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign thirt8 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign thirt9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign thirt10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign thirt11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign thirt = (thirt1 || thirt2 || thirt3 || thirt4 || thirt5 || thirt6 || thirt7 || thirt8 || thirt9 || thirt10 || thirt11);
//    //Fourt
//    assign fourt1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign fourt2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign fourt3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign fourt4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign fourt5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
//    assign fourt6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign fourt7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 8 && (pixel_index/96) <= 32);
//    assign fourt8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 67  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign fourt9 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign fourt = (fourt1 || fourt2 || fourt3 || fourt4 || fourt5 || fourt6 || fourt7 || fourt8 || fourt9);
//    //Fifth
//    assign fifth1 = ((pixel_index%96) >= 27 && (pixel_index%96) <= 29  && (pixel_index/96) >= 8 && (pixel_index/96) <= 55);
//    assign fifth2 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign fifth3 = ((pixel_index%96) >= 30 && (pixel_index%96) <= 32  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign fifth4 = ((pixel_index%96) >= 24 && (pixel_index%96) <= 26  && (pixel_index/96) >= 10 && (pixel_index/96) <= 12);
//    assign fifth5 = ((pixel_index%96) == 25 && (pixel_index/96) == 9);
//    assign fifth6 = ((pixel_index%96) == 26 && (pixel_index/96) >= 8 && (pixel_index/96) <= 9);
//    assign fifth7 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 8 && (pixel_index/96) <= 10);
//    assign fifth8 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41  && (pixel_index/96) >= 11 && (pixel_index/96) <= 29);
//    assign fifth9 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 30 && (pixel_index/96) <= 32);
//    assign fifth10 = ((pixel_index%96) >= 68 && (pixel_index%96) <= 70  && (pixel_index/96) >= 33 && (pixel_index/96) <= 52);
//    assign fifth11 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 70  && (pixel_index/96) >= 53 && (pixel_index/96) <= 55);
//    assign fifth = (fifth1 || fifth2 || fifth3 || fifth4 || fifth5 || fifth6 || fifth7 || fifth8 || fifth9 || fifth10 || fifth11);
    
//    //Unlock stages
//    wire amateur, pro, legen;
//    wire am1,am2,am3,am4,am5,am6,am7,am8,am9,am10,am11,am12,am13,am14,am15,am16,am17,am18,am19,am20,
//         am21,am22,am23,am24,am25,am26,am27,am28,am29,am30,am31;
//    wire pro1,pro2,pro3,pro4,pro5,pro6,pro7,pro8,pro9,pro10,pro11,pro12,pro13,pro14,pro15,pro16;
//    wire leg1,leg2,leg3,leg4,leg5,leg6,leg7,leg8,leg9,leg10,leg11,leg12,leg13,leg14,leg15,leg16,leg17,leg18,leg19,leg20,leg21,leg22,leg23,leg24;
    
//    assign am1 = ((pixel_index%96) == 24 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am2 = ((pixel_index%96) >= 25 && (pixel_index%96) <= 27 && (pixel_index/96) == 16);
//    assign am3 = ((pixel_index%96) >= 25 && (pixel_index%96) <= 27 && (pixel_index/96) == 25);
//    assign am4 = ((pixel_index%96) == 28 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
//    assign am5 = ((pixel_index%96) == 31 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am6 = ((pixel_index%96) == 32 && (pixel_index/96) == 16);
//    assign am7 = ((pixel_index%96) == 33 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am8 = ((pixel_index%96) == 34 && (pixel_index/96) == 16);
//    assign am9 = ((pixel_index%96) == 35 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
//    assign am10 = ((pixel_index%96) == 38 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am12 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41 && (pixel_index/96) == 16);
//    assign am13 = ((pixel_index%96) >= 39 && (pixel_index%96) <= 41 && (pixel_index/96) == 25);
//    assign am14 = ((pixel_index%96) == 42 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
//    assign am15 = ((pixel_index%96) >= 45 && (pixel_index%96) <= 49 && (pixel_index/96) == 16);
//    assign am16 = ((pixel_index%96) == 47 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
//    assign am17 = ((pixel_index%96) == 52 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am18 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 16);
//    assign am19 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 25);
//    assign am20 = ((pixel_index%96) >= 52 && (pixel_index%96) <= 56 && (pixel_index/96) == 35);
    
//    assign am21 = ((pixel_index%96) == 59 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am22 = ((pixel_index%96) >= 60 && (pixel_index%96) <= 62 && (pixel_index/96) == 35);
//    assign am23 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
    
//    assign am24 = ((pixel_index%96) == 66 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign am25 = ((pixel_index%96) >= 67 && (pixel_index%96) <= 69 && (pixel_index/96) == 16);
//    assign am26 = ((pixel_index%96) >= 67 && (pixel_index%96) <= 69 && (pixel_index/96) == 25);
//    assign am27 = ((pixel_index%96) == 70 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
//    assign am28 = ((pixel_index%96) == 67 && (pixel_index/96) == 26);
//    assign am29 = ((pixel_index%96) == 68 && (pixel_index/96) == 27);
//    assign am30 = ((pixel_index%96) == 69 && (pixel_index/96) == 28);
//    assign am31 = ((pixel_index%96) == 70 && (pixel_index/96) >= 29 && (pixel_index/96) <= 35);
//    assign amateur = (am1||am2||am3||am4||am5||am6||am7||am8||am9||am10||
//                      am11||am12||am13||am14||am15||am16||am17||am18||am19||am20||
//                      am21||am22||am23||am24||am25||am26||am27||am28||am29||am30||am31);
    
//    assign pro1 = ((pixel_index%96) == 39 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign pro2 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 16);
//    assign pro3 = ((pixel_index%96) >= 40 && (pixel_index%96) <= 42 && (pixel_index/96) == 25);
//    assign pro4 = ((pixel_index%96) == 43 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
//    assign pro5 = ((pixel_index%96) == 46 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign pro6 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 49 && (pixel_index/96) == 16);
//    assign pro7 = ((pixel_index%96) >= 47 && (pixel_index%96) <= 49 && (pixel_index/96) == 25);
//    assign pro8 = ((pixel_index%96) == 50 && (pixel_index/96) >= 16 && (pixel_index/96) <= 25);
//    assign pro9 = ((pixel_index%96) == 47 && (pixel_index/96) == 26);
//    assign pro10 = ((pixel_index%96) == 48 && (pixel_index/96) == 27);
//    assign pro11 = ((pixel_index%96) == 49 && (pixel_index/96) == 28);
//    assign pro12 = ((pixel_index%96) == 50 && (pixel_index/96) >= 29 && (pixel_index/96) <= 35);
//    assign pro13 = ((pixel_index%96) == 53 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign pro14 = ((pixel_index%96) >= 54 && (pixel_index%96) <= 56 && (pixel_index/96) == 16);
//    assign pro15 = ((pixel_index%96) >= 54 && (pixel_index%96) <= 56 && (pixel_index/96) == 35);
//    assign pro16 = ((pixel_index%96) == 57 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign pro = (pro1||pro2||pro3||pro4||pro5||pro6||pro7||pro8||pro9||pro10||
//                  pro11||pro12||pro13||pro14||pro15||pro16);
    
//    assign leg1 = ((pixel_index%96) == 28 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg2 = ((pixel_index%96) >= 28 && (pixel_index%96) <= 32 && (pixel_index/96) == 35);
//    assign leg3 = ((pixel_index%96) == 35 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg4 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 16);
//    assign leg5 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 25);
//    assign leg6 = ((pixel_index%96) >= 35 && (pixel_index%96) <= 39 && (pixel_index/96) == 35);
//    assign leg7 = ((pixel_index%96) == 42 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg8 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 46 && (pixel_index/96) == 16);
//    assign leg9 = ((pixel_index%96) >= 42 && (pixel_index%96) <= 46 && (pixel_index/96) == 35);
//    assign leg10 = ((pixel_index%96) == 46 && (pixel_index/96) >= 25 && (pixel_index/96) <= 35);
//    assign leg11 = ((pixel_index%96) >= 44 && (pixel_index%96) <= 46 && (pixel_index/96) == 25);
//    assign leg12 = ((pixel_index%96) == 49 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg13 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 16);
//    assign leg14 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 25);
//    assign leg15 = ((pixel_index%96) >= 49 && (pixel_index%96) <= 53 && (pixel_index/96) == 35);
//    assign leg16 = ((pixel_index%96) == 56 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg17 = ((pixel_index%96) >= 57 && (pixel_index%96) <= 59 && (pixel_index/96) == 16);
//    assign leg18 = ((pixel_index%96) == 60 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg19 = ((pixel_index%96) == 63 && (pixel_index/96) >= 16 && (pixel_index/96) <= 35);
//    assign leg20 = ((pixel_index%96) >= 64 && (pixel_index%96) <= 65 && (pixel_index/96) == 16);
//    assign leg21 = ((pixel_index%96) >= 64 && (pixel_index%96) <= 65 && (pixel_index/96) == 35);
//    assign leg22 = ((pixel_index%96) == 66 && (pixel_index/96) == 17);
//    assign leg23 = ((pixel_index%96) == 66 && (pixel_index/96) == 34);
//    assign leg24 = ((pixel_index%96) == 67 && (pixel_index/96) >= 18 && (pixel_index/96) <= 33);
//    assign legen = (leg1||leg2||leg3||leg4||leg5||leg6||leg7||leg8||leg9||leg10||
//                    leg11||leg12||leg13||leg14||leg15||leg16||leg17||leg18||leg19||leg20||
//                    leg21||leg22||leg23||leg24);
//    //Logic
//    always @(*)
//    begin
//        //Initial Game page
//        if (reset == 1 || sw[9] == 0)
//            initial_begin = 0;
//        if (shout && initial_begin == 0)
//            oled_data <= 16'h07E0;
//        else if (legend && initial_begin == 0)
//            oled_data <= 16'hAFE0;
//        else if (clap && initial_begin == 0)
//            oled_data <= 16'hF800;
//        else if (to && initial_begin == 0)
//            oled_data <= 16'hFFFF;
//        else if (start && initial_begin == 0)
//            oled_data <= 16'hFFFF;
//        else if (sw[9] == 1 && volume_level >= 5 && initial_begin == 0)
//            initial_begin = 1;
//        //End of initial game page  
          
//        else if(random_generate == 1 && initial_begin == 1)begin
//            if(one)oled_data <= 16'hFFFF;
//            else if(volume_level == 1)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 2 && initial_begin == 1)begin
//            if(two)oled_data <= 16'hFFFF;
//            else if(volume_level == 2)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 3 && initial_begin == 1)begin
//            if(three)oled_data <= 16'hFFFF;
//            else if(volume_level == 3)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 4 && initial_begin == 1)begin
//            if(four)oled_data <= 16'hFFFF;
//            else if(volume_level == 4)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 5 && initial_begin == 1)begin
//            if(five)oled_data <= 16'hFFFF;
//            else if(volume_level == 5)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 6 && initial_begin == 1)begin
//            if(six)oled_data <= 16'hFFFF;
//            else if(volume_level == 6)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 7 && initial_begin == 1)begin
//            if(seven)oled_data <= 16'hFFFF;
//            else if(volume_level == 7)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 8 && initial_begin == 1)begin
//            if(eight)oled_data <= 16'hFFFF;
//            else if(volume_level == 8)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 9 && initial_begin == 1)begin
//            if(nine)oled_data <= 16'hFFFF;
//            else if(volume_level == 9)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 10 && initial_begin == 1)begin
//            if(ten)oled_data <= 16'hFFFF;
//            else if(volume_level == 10)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 11 && initial_begin == 1)begin
//            if(elev)oled_data <= 16'hFFFF;
//            else if(volume_level == 10)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 12 && initial_begin == 1)begin
//            if(tw)oled_data <= 16'hFFFF;
//            else if(volume_level == 12)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 13 && initial_begin == 1)begin
//            if(thirt)oled_data <= 16'hFFFF;
//            else if(volume_level == 13)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 14 && initial_begin == 1)begin
//            if(fourt)oled_data <= 16'hFFFF;
//            else if(volume_level == 14)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if(random_generate == 15 && initial_begin == 1)begin
//            if(fifth)oled_data <= 16'hFFFF;
//            else if(volume_level == 15)
//                random_generate = random_generate + 2;
//            else oled_data <= 0;
//        end
//        else if (random_generate == 0 && initial_begin == 1)
//            random_generate <= 1; 
//        else
//            oled_data  <= 0;
//    end
//endmodule
