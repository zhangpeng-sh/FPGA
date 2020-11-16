`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/27 23:08:27
// Design Name: 
// Module Name: flow_led_top
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
 module flow_led_top 
    #(parameter end_cnt = 50000000)            
 	(
 	input  wire		  IN_CLK_50M   ,   
 	input  wire		  PB	       ,    	 
 	output reg  [7:0] LED  = 8'hff        
 	);
 	
 // cnt_reg  define  
 reg  [31:0] cnt = 0 ;
 reg         sys_rst_n = 0 ; 
 //*********************************
 //**       main code 
 //*********************************
 
 always @ (posedge IN_CLK_50M )
     sys_rst_n <= PB ;
 
 always @ (posedge IN_CLK_50M )
 	begin 
 		if (~sys_rst_n)
 			cnt	<= 32'd0 ;
 		else 
 		begin 
 			if (cnt < ( end_cnt-1 ) )
 				cnt	<=	cnt + 1 ;
 			else 
 				cnt <= 0 ;
 		end 
 	end
 
 always @ (posedge IN_CLK_50M )
 	begin 
 		if ( ~sys_rst_n )
 			LED  <= 8'hff ;
 		else	
 		begin 
 			if ( LED == 8'hff)
 				LED  <= 8'hfe ;
 			else	
 			begin 	
 				if (cnt == end_cnt-1)	     	
 					LED <= {LED[6:0], LED[7]};
 				else 
 					LED <= LED ;
 			end
 	
 		end
 	end
 endmodule
