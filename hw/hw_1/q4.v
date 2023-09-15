module FSM(
    input rst,  // Reset input
    input A,    // Input signal A
    output Y    // Output signal Y
);
reg [1:0] state = 2'b00;  // FSM state register

always @(A or state or rst) begin
    case(state)
        2'b00: begin
            state0 state0_inst(
                .rst(rst),
                .A(A),
                .Y(Y),
                .state(state)
            );
        end
        2'b01: begin
            state1 state1_inst(
                .A(A),
                .Y(Y),
                .state(state)
            );
        end
        2'b10: begin
            state2 state2_inst(
                .A(A),
                .Y(Y),
                .state(state)
            );
        end
    endcase
end
endmodule

module state0(
    input rst,    // Reset input
    input A,      // Input signal A
    output Y,     // Output signal Y
    output reg state  // State register for this state
);
always @(A, rst) begin
    if(rst || ~A) begin
        Y <= 0;
        state <= 2'b00;  // Transition to state 00
    end
    else begin
        Y <= 1;
        state <= 2'b01;  // Transition to state 01
    end
end

endmodule

module state1(
    input A,      // Input signal A
    output Y,     // Output signal Y
    output reg state  // State register for this state
);
always @(A) begin
    if(~A) begin
        Y <= 1;
        state <= 2'b01;  // Transition to state 01
    end
    else begin
        Y <= 0;
        state <= 2'b10;  // Transition to state 10
    end
end

endmodule

module state2(
    input A,      // Input signal A
    output Y,     // Output signal Y
    output reg state  // State register for this state
);
always @(A) begin
    Y <= 0;
    state <= 2'b00;  // Transition to state 00
end

endmodule
