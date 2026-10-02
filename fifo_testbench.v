`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 23:51:01
// Design Name: 
// Module Name: fifo_testbench
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


module fifo_testbench;
parameter data_width=8;
parameter fifo_width=32;
reg [data_width-1:0] data_in;
reg wr_en;
reg rd_en;
reg clk;
reg reset;
wire [data_width-1:0] data_out;
wire full ;
wire empty;
FIFO #(.data_width(data_width),
      .fifo_width(fifo_width))
dut(.data_out(data_out),
.data_in(data_in),
.full(full),
.empty(empty),
.rd_en(rd_en),
.wr_en(wr_en),
.reset(reset),
.clk(clk));
// clock generation
initial begin 

clk=0;
forever #5clk = ~clk;
end
// test sequence 
initial begin
data_in=8'h00;
wr_en=0;
rd_en=0;
reset=1;
#20 ;
reset=0;
// push 
 @(negedge clk)
 data_in=8'h10;
 wr_en=1;
  @(negedge clk)
   wr_en=0;
 
 @(negedge clk)
 data_in=8'h20;
 wr_en=1;
  @(negedge clk)
 wr_en=0;
 // pop 
  @(negedge clk)
  rd_en=1;
   @(negedge clk)
   rd_en=0;

   @(negedge clk)
   rd_en=1;
     @(negedge clk)
     rd_en=0;
    #20;
      $finish;
      end
      
       initial begin
        $monitor("Time=%0t | reset=%b | wr_en=%b | rd_en=%b | data_in=%h | data_out=%h | full=%b | empty=%b",
                 $time, reset, wr_en, rd_en, data_in, data_out, full, empty);
    end
 
 


endmodule
