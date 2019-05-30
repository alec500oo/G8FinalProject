module KeyboardDriver (input logic clk, // Clock driven by device
                       input logic data, // Data in (serially driven)
                       input logic reset_n, // Reset active LOW
                       output logic[7:0] code, // Output code
                       output logic ext, // Extended key code (Arrow, Ctrl...)
                       output logic back); // "Back" received, key released.

    logic[9:0] storageRegister; // Ext in bit 9, back in bit 8, data [7:0]

    // Data shift register.
    logic[10:0] dataShift; // 11 bit data shift register 
    always_ff @(negedge clk, negedge reset_n) begin
        if (!reset_n) dataShift <= 11'b0;
        else dataShift <= {dataShift[9:0], data};
    end

    // Data in counter.
    logic[3:0] dataCount;
    logic dataLatch;
    always_ff @(negedge clk, negedge reset_n) begin
        if (!reset_n) dataCount <= 4'b0;
        else dataCount <= (dataCount + 'b1);
    end
    assign dataLatch = (dataCount >= 11) ? 'b1 : 'b0; // Latch data when count is over 11.

    // Data latch
    /* Assign the data from the incomming message and flip it around to
       MSB first. */
    always_ff @(posedge dataLatch, negedge reset_n) begin
        if (!reset_n) storageRegister <= 10'b0;
        else storageRegister[7:0] <= dataShift[8:1];
    end

    // Split the storage regitser into the output lines.
    assign ext = storageRegister[9];
    assign back = storageRegister[8];
    assign code = storageRegister[7:0];
endmodule