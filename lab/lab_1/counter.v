module Counter (
    input clk,        // Clock input
    input reset,      // Reset input
    input BTN0,       // Button 0 input
    input BTN1,       // Button 1 input
    output [3:0] LEDS  // 4-bit LED output
);

reg [3:0] count = 4b'0000;           // 4-bit counter register
reg clk_slow;
clock_divider clk_divider(clk, reset, clk_slow);


always @(posedge clk_slow or posedge reset) begin
    if (reset) begin
        count <= 0;  // Reset the counter to 0
    end else if (BTN0) begin
        count <= count + 1; // Increment the counter on BTN0 press
    end else if (BTN1) begin
        count <= count - 1; // Decrement the counter on BTN1 press
    end
end


assign LEDS[3:0] = count[3:0];       // Connect the counter output to the LEDs

endmodule
