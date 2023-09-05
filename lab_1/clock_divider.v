module clock_divider(
    input wire clk,
    input wire reset,
    input wire clk_divisor,
    output wire clk_slow
);
reg [24:0] counter;  // 25-bit slow clock counter


always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 25'b0;  // Reset the counter to 0
    end else if (counter == clk_divisor - 1) begin
        counter <= 25'b0;  // Reset the counter to 0
    end else begin
        counter <= counter + 1;
    end
end

assign clk_slow = (counter == clk_divisor - 1);

endmodule
