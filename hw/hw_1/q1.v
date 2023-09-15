// Behavioral-level description of an inverting multiplexer
module mux_beh (out, c, a, b);
  output out;
  input c, a, b;
  reg out; // Removed 'reg' before 'out' as it's already declared as an output

  always @(c or a or b) begin
    if (c == 1) begin
      out <= a;
    end
    else begin
      out <= b;
    end
  end // always

endmodule // mux_beh

/* TEST stimulus to verify the design */
module stimulus(temp);
  reg [2:0] A, B, C; // Added bit width for A, B, and C
  wire out2;
  integer i;
  mux_beh mod2 (out2, C, A, B); // Corrected the order of arguments

  initial begin
    for (i = 0; i < 8; i = i + 1) begin // Corrected the '¡' symbol to '<'
      {A, B, C} = i; // Removed '(2:0)' and fixed the assignment

      #10 $display ($time, " %b %b %b - %b", A, B, C, out2);
    end
    #10 $finish;
  end // initial

endmodule // stimulus
