module testbench;

  reg rst;
  reg A;
  wire Y;

  FSM uut (
    .rst(rst),
    .A(A),
    .Y(Y)
  );

  // Initializations
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);

    // Apply reset (rst = 1)
    rst = 1;
    A = 0;
    #10; // Wait for 10 time units

    // Release reset (rst = 0)
    rst = 0;
    #10;

    // Sequence for input A: 0 -> 1 -> 0 -> 1 -> 0
    A = 1;
    #10; // A = 1
    A = 0;
    #10; // A = 0
    A = 1;
    #10; // A = 1
    A = 0;
    #10; // A = 0

    // Finish simulation
    $finish;
  end

  // Simulation time step
  always #5 clk = ~clk;

endmodule
