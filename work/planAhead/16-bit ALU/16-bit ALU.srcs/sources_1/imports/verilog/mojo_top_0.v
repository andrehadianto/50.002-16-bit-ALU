/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 2'd0;
  localparam INPUTA_state = 2'd1;
  localparam INPUTB_state = 2'd2;
  localparam CALCULATE_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  reg [15:0] M_inp_a_d, M_inp_a_q = 1'h0;
  reg [15:0] M_inp_b_d, M_inp_b_q = 1'h0;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_inp_a_d = M_inp_a_q;
    M_inp_b_d = M_inp_b_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led[16+0+5-:6] = io_dip[16+0+5-:6];
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    M_seg_values = 16'h0000;
    
    case (M_state_q)
      IDLE_state: begin
        M_seg_values = 16'h8364;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = INPUTA_state;
        end
      end
      INPUTA_state: begin
        M_seg_values = 16'hfab0;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inp_a_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[2+0-:1] == 1'h1) begin
          M_state_d = INPUTB_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = IDLE_state;
          end
        end
      end
      INPUTB_state: begin
        M_seg_values = 16'hfab1;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        M_inp_b_d = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = CALCULATE_state;
        end else begin
          if (io_button[3+0-:1] == 1'h1) begin
            M_state_d = IDLE_state;
          end
        end
      end
      CALCULATE_state: begin
        M_seg_values = 16'ha06a;
        M_alu_a = M_inp_a_q;
        M_alu_b = M_inp_b_q;
        M_alu_alufn = io_dip[16+0+5-:6];
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        if (io_button[3+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_inp_a_q <= M_inp_a_d;
    M_inp_b_q <= M_inp_b_d;
    M_state_q <= M_state_d;
  end
  
endmodule
