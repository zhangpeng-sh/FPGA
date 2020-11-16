`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/27 23:30:55
// Design Name: 
// Module Name: flow_led_tb
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
module flow_led_tb();
    reg  	   IN_CLK_50M ;
    reg  	   PB         ;
    wire [7:0] LED        ;
    
    flow_led_top 
        #(.end_cnt (10))         
    flow_led_top_inst
           (
			.IN_CLK_50M (IN_CLK_50M) ,   
			.PB         (PB)		 ,      
			.LED        (LED)            
			);
		
		initial  IN_CLK_50M=0 ;	
		always #10 IN_CLK_50M =~IN_CLK_50M ;
		
		initial 
			begin 		
				PB =0 ; 
				#40   ;
				PB = 1 ; 
				
				#2000 ;
				$stop ; 
			end 		
endmodule
