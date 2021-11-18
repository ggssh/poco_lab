`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/10/20 09:14:07
// Design Name:
// Module Name: pc_reg
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


module pc_reg(
         input wire clk,
         input wire rst,
         output reg[31:0] pc,//pc的宽度为6,对应rom的地址宽度为6位
         output reg ce//指令存储器使能信号
       );

always @(posedge clk)
  begin//在时钟信号上升沿触发
    if (rst == 1'b1)
      begin
        ce <= 1'b0; //复位信号有效时指令存储器使能信号无效
      end
    else
      begin
        ce <= 1'b1; //复位信号无效时指令存储器使能信号有效
      end
  end

always @(posedge clk)
  begin
    if (ce == 1'b0)
      begin
        pc <= 32'h0;//指令存储器使能信号无效时pc保持为0
      end
    else
      begin
        pc <= pc + 32'h4; //指令存储器使能信号有效时,pc在每个时钟加4
      end
  end
endmodule
