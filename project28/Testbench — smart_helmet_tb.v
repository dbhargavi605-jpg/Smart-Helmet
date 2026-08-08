`timescale 1ns/1ps

module smart_helmet_tb;

reg clk;
reg reset;

reg helmet_worn;
reg alcohol_detected;
reg accident_detected;

wire helmet_ok;
wire engine_enable;
wire alarm;

smart_helmet uut (

    .clk(clk),
    .reset(reset),

    .helmet_worn(helmet_worn),
    .alcohol_detected(alcohol_detected),
    .accident_detected(accident_detected),

    .helmet_ok(helmet_ok),
    .engine_enable(engine_enable),
    .alarm(alarm)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    // Generate waveform
    $dumpfile("waveform.vcd");
    $dumpvars(0, smart_helmet_tb);

    clk = 0;
    reset = 1;

    helmet_worn = 0;
    alcohol_detected = 0;
    accident_detected = 0;

    // --------------------------------
    // Reset
    // --------------------------------

    #10;

    reset = 0;

    // --------------------------------
    // TEST 1
    // Helmet NOT worn
    // --------------------------------

    helmet_worn = 0;
    alcohol_detected = 0;
    accident_detected = 0;

    #10;

    $display(
        "Time=%0t | Helmet=%b | Alcohol=%b | Accident=%b | Engine=%b | Alarm=%b",
        $time,
        helmet_worn,
        alcohol_detected,
        accident_detected,
        engine_enable,
        alarm
    );

    // --------------------------------
    // TEST 2
    // Helmet worn
    // --------------------------------

    helmet_worn = 1;
    alcohol_detected = 0;
    accident_detected = 0;

    #10;

    $display(
        "Time=%0t | Helmet=%b | Alcohol=%b | Accident=%b | Engine=%b | Alarm=%b",
        $time,
        helmet_worn,
        alcohol_detected,
        accident_detected,
        engine_enable,
        alarm
    );

    // --------------------------------
    // TEST 3
    // Alcohol detected
    // --------------------------------

    helmet_worn = 1;
    alcohol_detected = 1;
    accident_detected = 0;

    #10;

    $display(
        "Time=%0t | Helmet=%b | Alcohol=%b | Accident=%b | Engine=%b | Alarm=%b",
        $time,
        helmet_worn,
        alcohol_detected,
        accident_detected,
        engine_enable,
        alarm
    );

    // --------------------------------
    // TEST 4
    // Accident detected
    // --------------------------------

    helmet_worn = 1;
    alcohol_detected = 0;
    accident_detected = 1;

    #10;

    $display(
        "Time=%0t | Helmet=%b | Alcohol=%b | Accident=%b | Engine=%b | Alarm=%b",
        $time,
        helmet_worn,
        alcohol_detected,
        accident_detected,
        engine_enable,
        alarm
    );

    // --------------------------------
    // TEST 5
    // Normal operation
    // --------------------------------

    helmet_worn = 1;
    alcohol_detected = 0;
    accident_detected = 0;

    #10;

    $display(
        "Time=%0t | Helmet=%b | Alcohol=%b | Accident=%b | Engine=%b | Alarm=%b",
        $time,
        helmet_worn,
        alcohol_detected,
        accident_detected,
        engine_enable,
        alarm
    );

    #10;

    $finish;

end

endmodule