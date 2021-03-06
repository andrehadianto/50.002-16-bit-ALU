/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comparator_7 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] cmp
  );
  
  
  
  always @* begin
    cmp[0+15-:16] = 1'h0;
    
    case (alufn[0+2-:3])
      3'h3: begin
        if (a == b) begin
          cmp[0+0-:1] = 1'h1;
        end
      end
      3'h5: begin
        if ($signed(a) < $signed(b)) begin
          cmp[0+0-:1] = 1'h1;
        end
      end
      3'h7: begin
        if ($signed(a) <= $signed(b)) begin
          cmp[0+0-:1] = 1'h1;
        end
      end
      default: begin
        cmp[0+0-:1] = 1'h0;
      end
    endcase
  end
endmodule
