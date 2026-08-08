module smart_helmet (
    input  wire clk,
    input  wire reset,

    input  wire helmet_worn,
    input  wire alcohol_detected,
    input  wire accident_detected,

    output reg helmet_ok,
    output reg engine_enable,
    output reg alarm
);

always @(posedge clk or posedge reset) begin

    if (reset) begin

        helmet_ok    <= 1'b0;
        engine_enable <= 1'b0;
        alarm         <= 1'b0;

    end

    else begin

        // Helmet detection
        helmet_ok <= helmet_worn;

        // Engine control
        if (helmet_worn && !alcohol_detected)
            engine_enable <= 1'b1;
        else
            engine_enable <= 1'b0;

        // Alarm control
        if (alcohol_detected || accident_detected)
            alarm <= 1'b1;
        else
            alarm <= 1'b0;

    end

end

endmodule