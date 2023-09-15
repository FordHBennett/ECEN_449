module clock_divider(
    input  clk,
    input  reset,
    input  clk_divisor,
    output reg clk_slow
);
reg [32:0] counter;  // 32-bit slow clock counter


always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0;  // Reset the counter to 0
    end else if (counter == 25000000 - 1) begin
        counter <= 0;  // Reset the counter to 0
    end else begin
        counter <= counter + 1; // Increment the counter
    end
end

assign clk_slow = (counter == clk_divisor - 1);

endmodule
