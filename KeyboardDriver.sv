module KeyboardDriver (input logic clk, // Clock driven by device 10MHz - 16MHz
                       input logic data, // Data in (serially driven)
                       input logic clk, // Internal FPGA clock for state machine.
                       input logic reset_n, // Reset active LOW
                       output logic[7:0] code); // Output code

    // --- Shift Register ---
    logic[10:0] shiftRegData;
    always_ff @(negedge clk, negedge reset_n) begin
        if (!reset_n) shiftRegData <= 11'b0;
        else shiftRegData <= {shiftRegData[9:0], data}; // Shift data in from 0 ---> 10
    end
    // --- End Shift Register ---


    // --- Counter ---
    logic[3:0] dataInCount;
    logic countLatch;
    always_ff @(negedge clk, negedge reset_n) begin
        if (!reset_n) dataInCount <= 4'b0;
        else if (dataInCount > 4'd11) dataInCount <= 4'b0;
        else dataInCount <= (dataInCount + 1'b1);
    end
    assign countLatch = (dataInCount >= 4'd11); // TODO: Check this logic.
    // --- End Counter ---

    // Latch
    logic latch;
    assign latch = ((^shiftRegData[9:1]) == 1'b1) & countLatch;

    // --- Output Latch ---
    always_ff @(posedge latch, negedge reset_n) begin
        if (!reset_n) code <= 8'b0;
        else code <= shiftRegData[8:1]; // TODO: This may be backwards. TODO: flip the data so it's MSB first.
    end
    // --- End Output Latch ---
endmodule