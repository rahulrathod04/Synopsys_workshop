/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue Oct  1 12:35:55 2024
/////////////////////////////////////////////////////////////


module round_robin_arbiter ( clk, i_rst_n, i_req, o_grant );
  input [3:0] i_req;
  output [3:0] o_grant;
  input clk, i_rst_n;
  wire   N5, N6, N7, N8, N11, N12, N13, N14, n1, n2, n3, n4;
  wire   [3:0] shift_reg;

  DFFASX1_RVT \shift_reg_reg[0]  ( .D(N11), .CLK(clk), .SETB(i_rst_n), .Q(
        shift_reg[0]) );
  DFFARX1_RVT \shift_reg_reg[1]  ( .D(N12), .CLK(clk), .RSTB(i_rst_n), .Q(
        shift_reg[1]) );
  DFFARX1_RVT \shift_reg_reg[2]  ( .D(N13), .CLK(clk), .RSTB(i_rst_n), .Q(
        shift_reg[2]) );
  DFFARX1_RVT \shift_reg_reg[3]  ( .D(N14), .CLK(clk), .RSTB(i_rst_n), .Q(
        shift_reg[3]), .QN(n1) );
  DFFARX1_RVT \o_grant_reg[3]  ( .D(N8), .CLK(clk), .RSTB(i_rst_n), .Q(
        o_grant[3]) );
  DFFARX1_RVT \o_grant_reg[2]  ( .D(N7), .CLK(clk), .RSTB(i_rst_n), .Q(
        o_grant[2]) );
  DFFARX1_RVT \o_grant_reg[1]  ( .D(N6), .CLK(clk), .RSTB(i_rst_n), .Q(
        o_grant[1]) );
  DFFARX1_RVT \o_grant_reg[0]  ( .D(N5), .CLK(clk), .RSTB(i_rst_n), .Q(
        o_grant[0]) );
  AND2X1_RVT U4 ( .A1(shift_reg[3]), .A2(n2), .Y(N8) );
  AND2X1_RVT U5 ( .A1(shift_reg[2]), .A2(n2), .Y(N7) );
  AND2X1_RVT U6 ( .A1(shift_reg[1]), .A2(n2), .Y(N6) );
  AND2X1_RVT U7 ( .A1(shift_reg[0]), .A2(n2), .Y(N5) );
  AO221X1_RVT U8 ( .A1(shift_reg[2]), .A2(i_req[2]), .A3(shift_reg[3]), .A4(
        i_req[3]), .A5(n3), .Y(n2) );
  AO22X1_RVT U9 ( .A1(shift_reg[1]), .A2(i_req[1]), .A3(shift_reg[0]), .A4(
        i_req[0]), .Y(n3) );
  AND2X1_RVT U10 ( .A1(shift_reg[2]), .A2(n4), .Y(N14) );
  AND2X1_RVT U11 ( .A1(shift_reg[1]), .A2(n4), .Y(N13) );
  AND2X1_RVT U12 ( .A1(shift_reg[0]), .A2(n4), .Y(N12) );
  NAND2X0_RVT U13 ( .A1(n1), .A2(n4), .Y(N11) );
  OR4X1_RVT U14 ( .A1(i_req[0]), .A2(i_req[1]), .A3(i_req[2]), .A4(i_req[3]), 
        .Y(n4) );
endmodule

