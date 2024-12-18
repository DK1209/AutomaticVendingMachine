// Code your design here
module vending_machine(
  input clk,
  input rst,
  input [1:0] in,
  output reg out,
  output reg[1:0] change
);
  
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  
  reg [1:0] next_state, curr_state;
  
  always@(posedge clk) 
    begin
      if (rst==1) begin
        curr_state=0;
        next_state=0;
        change=2'b00;
      end
      else curr_state=next_state;
      
      case(curr_state) 
        s0:
        if (in==0) begin
          next_state=s0;
          change=2'b00;
          out=0;
        end
        else if (in==2'b01) begin
          next_state=s1;
          change=2'b00;
          out=0;
        end
        else if (in==2'b10) begin
          next_state=s2;
          change=2'b00;
          out=0;
        end
    
        s1:
          if (in==0) begin
            next_state=s0;
            change=2'b01;
            out=0;
          end
        else if (in==2'b01) begin
          next_state=s2;
          change=2'b00;
          out=0;
        end 
        else if (in==2'b10) begin
          next_state=s0;
          out=1;
          change=2'b00;
        end
     
        s2:
          if (in==0) begin
            next_state=s0;
            change=2'b10;
            out=0;
          end
        else if (in==2'b01) begin
          next_state=s0;
          out=1;
          change=2'b00;
        end
        else if (in==2'b10) begin
          next_state=s0;
          change=2'b01;
          out=1;
        end
        endcase
      end
        endmodule
