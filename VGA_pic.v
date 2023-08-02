module VGA_pic(
input wire vga_clk , 		//输入工作时钟,频率25MHz
input wire sys_rst_n , 		//输入复位信号,低电平有效
input wire [9:0] pix_x , 	//输入有效显示区域像素点X轴坐标
input wire [9:0] pix_y , 	//输入有效显示区域像素点Y轴坐标

output reg [23:0] pix_data //输出像素点色彩信息
);

 //parameter define
 parameter H_VALID = 10'd640 , 	//行有效数据
 V_VALID = 10'd480 ; 				//场有效数据

 parameter RED = 24'hFF0000, 	//红色
 ORANGE = 24'hFC000, 			//橙色
 YELLOW = 24'hFFFF00, 			//黄色
 GREEN = 24'h00FF00, 			//绿色
 CYAN = 24'h00FFFF, 				//青色
 BLUE = 24'h0000FF, 				//蓝色
 PURPPLE = 24'hFF00FF, 			//紫色
 BLACK = 24'h000000, 			//黑色
 WHITE = 24'hFFFFFF, 			//白色
 GRAY = 24'h35141A; 				//灰色

 //pix_data:输出像素点色彩信息,根据当前像素点坐标指定当前像素点颜色数据
 always@(posedge vga_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
 pix_data <= 24'd0;
 else if((pix_x >= 0) && (pix_x < (H_VALID/10)*1))
 pix_data <= RED;
 else if((pix_x >= (H_VALID/10)*1) && (pix_x < (H_VALID/10)*2))
 pix_data <= ORANGE;
 else if((pix_x >= (H_VALID/10)*2) && (pix_x < (H_VALID/10)*3))
 pix_data <= YELLOW;
 else if((pix_x >= (H_VALID/10)*3) && (pix_x < (H_VALID/10)*4))
 pix_data <= GREEN;
 else if((pix_x >= (H_VALID/10)*4) && (pix_x < (H_VALID/10)*5))
 pix_data <= CYAN;
 else if((pix_x >= (H_VALID/10)*5) && (pix_x < (H_VALID/10)*6))
 pix_data <= BLUE;
 else if((pix_x >= (H_VALID/10)*6) && (pix_x < (H_VALID/10)*7))
 pix_data <= PURPPLE;
 else if((pix_x >= (H_VALID/10)*7) && (pix_x < (H_VALID/10)*8))
 pix_data <= BLACK;
 else if((pix_x >= (H_VALID/10)*8) && (pix_x < (H_VALID/10)*9))
 pix_data <= WHITE;
 else if((pix_x >= (H_VALID/10)*9) && (pix_x < H_VALID))
 pix_data <= GRAY;
 else
 pix_data <= BLACK;

 endmodule