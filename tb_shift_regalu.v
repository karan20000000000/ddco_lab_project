module tb;
    reg [15:0] i0, i1, d_in;
    reg [2:0] op, rd_addr_a, rd_addr_b, wr_addr;
    wire [15:0] outp, d_out_a, d_out_b;
    wire cout;
    reg reset, sel, wr;

    reg clk;
    initial clk = 1'b0; always #5 clk = ~clk;


    initial begin
      $dumpfile("tb.vcd");
      $dumpvars(0, tb);
    end

    reg_alu regalu_m(clk, reset, sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in, d_out_a, d_out_b, cout);

    initial begin
      rd_addr_a = 3'b001;
      rd_addr_b = 3'b010;
      sel = 1'b0;
      reset = 1'b1;

      #6
      reset = 1'b0;
      wr = 1'b1;
      d_in = 16'hcb7f;
      wr_addr = 3'b001;
      #10
      d_in = 16'h0013;
      wr_addr = 3'b010;
      #10

      sel = 1'b1;
      op = 3'b100;
      wr_addr = 3'b011;
      #10
      op = 3'b101;
      wr_addr = 3'b100;
      #10
      op = 3'b110;
      wr_addr = 3'b101;
      #10
      op = 3'b111;
      wr_addr = 3'b110;

      #20;
      $finish;
    end

endmodule