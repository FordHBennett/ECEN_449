module jackpot (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire [3:0] SWITCHES,       // switches
    output wire [3:0] LEDS  // 4-bit LED output
);

reg [3:0] count = 1'b0000;           // 4-bit counter register
parameter CLOCK_DIVISOR = (125000000 / 4);
reg clk_slow;
clock_divider clk_divider(clk, reset, CLOCK_DIVISOR, clk_slow);

always @(posedge clk_slow or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;  // Reset the counter to 0
    end
    else if((SWITCHES[0] = 1'b1) == (count[0] = 1'b1)) begin
        count <= 4'b1111;
    end
    else if((SWITCHES[1] = 1'b1) == (count[1] = 1'b1)) begin
        count <= 4'b1111;
    end
    else if((SWITCHES[2] = 1'b1) == (count[2] = 1'b1)) begin
        count <= 4'b1111;
    end
    else if((SWITCHES[3] = 1'b1) == (count[3] = 1'b1)) begin
        count <= 4'b1111;
    end
    else if (count == 4'b1111) begin
        count <= 4'b0000;
    end
    else begin
        count <= (count << 1) + 1;

    end
end


assign LEDS[3:0] = count[3:0];       // Connect the counter output to the LEDs

endmodule
