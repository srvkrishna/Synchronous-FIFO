`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 22:39:47
// Design Name: 
// Module Name: FIFO
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


module FIFO #(parameter data_width=8,
             parameter fifo_width=32
             )(
             output reg [data_width-1:0]data_out,
             output full,
             output empty,
             input [data_width-1:0]data_in,
             input rd_en,
             input wr_en,
             input reset,
             input clk) ;
             reg [data_width-1:0] memory[fifo_width-1:0];
             reg  [data_width-1:0] rd_ptr,wr_ptr,depth_cnt;
             //PUSH OPERATION
             always @(posedge clk)
             if (reset)
             wr_ptr='h0;
             else begin
             if (wr_en&&!full)
             begin
             memory[wr_ptr]<=data_in;
             wr_ptr<=wr_ptr+1;
             end
             end
             // POP OPERATTION
             always @(posedge clk)
             if (reset)
             rd_ptr='h0;
             else begin
             if (rd_en&&!empty)
             begin
             data_out<=memory[rd_ptr];
             rd_ptr<=rd_ptr+1;
             end
             end
             //DEPTH COUNT
             always @(posedge clk)
             if (reset)
             depth_cnt='h0;
             else begin
             if (wr_en&&!full)
             depth_cnt<=depth_cnt+1;
             else if(rd_en&&!empty)
             depth_cnt<=depth_cnt-1;
             end
     assign full=(depth_cnt==fifo_width);
     assign empty=(depth_cnt==0);
             
                         
endmodule



