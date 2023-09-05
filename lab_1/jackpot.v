module jackpot (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire [3:0] SWITCHES,       // switches
    output wire [3:0] LED  // 4-bit LED output
);

reg [3:0] count;           // 4-bit counter register
reg[3:0] led_count = 4'b0000;
parameter CLOCK_DIVISOR = (125000000 / 4);

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
            led_count <= 4'b0000;
        end
        else if(SWITCHES[0] == count[0]) begin
            count <= 4'b1111;
        end
        else if(SWITCHES[1] == count[1]) begin
            count <= 4'b1111;
        end
        else if(SWITCHES[2] == count[2]) begin
            count <= 4'b1111;
        end
        else if(SWITCHES[3] == count[3]) begin
            count <= 4'b1111;
        end
        else if (count == 4'b1111) begin
            count <= 4'b0000;
            led_count <= 4'b0000;
        end
        else begin
            led_count <= led_count + 1 + 2;
            count <= count + led_count;
        end
    end
end

assign LED = count;       // Connect the counter output to the LEDs

endmodule
