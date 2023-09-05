module Counter (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire BTN0,       // Button 0 input
    input wire BTN1,       // Button 1 input
    output wire [3:0] LED  // 4-bit LED output
);

reg [3:0] count;           // 4-bit counter register
parameter CLOCK_DIVISOR = 125000000;

always @(posedge clk or posedge reset) begin
    clock_divider clk_divider (
        .clk(clk),
        .reset(reset),
        .clk_divisor(CLOCK_DIVISOR),
        .clk_slow(clk_slow)
    );
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
end

assign LED = count;       // Connect the counter output to the LEDs

endmodule
