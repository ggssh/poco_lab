`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/10/20 09:21:40
// Design Name:
// Module Name: rom
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


module rom(
           input wire ce, //存储器使能信号
           input wire[5:0] addr,
           output reg[31:0] inst //指令宽度为32
       );
reg[31:0] rom[63:0]; //使用二维向量定义存储器,深度是64,每个元素即为指令,宽度为32位,所以地址选用6位即可

initial begin
    $readmemh("rom.data",rom);
end

always @(*) begin
    if(ce == 1'b0) begin
        inst <= 32'h0; //这里使用十六进制
    end
    else begin
        inst <= rom[addr]; //使能信号有效时,给出地址addr对应的指令
    end
end
endmodule
