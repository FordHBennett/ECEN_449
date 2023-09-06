module Counter (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire BTN0,       // Button 0 input
    input wire BTN1,       // Button 1 input
    output wire [3:0] LEDS  // 4-bit LED output
);

reg [3:0] count = 4b'0000;           // 4-bit counter register
parameter CLOCK_DIVISOR = 125000000;
clock_divider clk_divider(clk, reset, CLOCK_DIVISOR, clk_slow);


always @(posedge clk_slow or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;  // Reset the counter to 0
    end else if (BTN0) begin
        count <= count + 1; // Increment the counter on BTN0 press
    end else if (BTN1) begin
        count <= count - 1; // Decrement the counter on BTN1 press
    end
    // Add additional conditions for other behaviors if needed.
end


assign LEDS[3:0] = count[3:0];       // Connect the counter output to the LEDs

endmodule
