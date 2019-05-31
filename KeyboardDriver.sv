module KeyboardDriver (input logic data_clk, // Clock driven by device
                       input logic data, // Data in (serially driven)
                       input logic clk, // Internal FPGA clock for state machine.
                       input logic reset_n, // Reset active LOW
                       output logic[7:0] code, // Output code
                       output logic ext, // Extended key code (Arrow, Ctrl...)
                       output logic back); // "Back" received, key released.

    logic[9:0] storageRegister; // Ext in bit 9, back in bit 8, data [7:0]

    // State machine logic
    typedef enum logic[2:0] { rec, checkData, setBa, setExt, latchOut, clear } t_state;
    t_state[2:0] state, nextState; // State registers.

    // State Register
    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) state <= clear;
        else state <= nextState;
    end

    // Next logic
    logic data_in;
    logic[7:0] data;
    always_comb begin
        case({state, data, data_in})
            {rec, 8'bx, 'b0}: nextState <= rec;
            {rec, 8'bx, 'b1}: nextState <= checkData;
            {checkData, 'hF0, 'bx}: nextState <= setBa; // TODO: Might need to set constant to 'h0F because data comes
            {setBa, 'hF0, 'bx}: nextState <= rec;       // in LSB first.
            {checkData, 'hE0, 'bx}: nextState <= setExt; // TODO: Might need to set constant to 'h0E because data comes
            {setExt, 'hE0, 'bx}: nextState <= rec;       // in LSB first.
            {checkData, 8'bx, 'bx}: nextState <= latchOut;
            {latchOut, 8'bx, 'bx}: nextState <= clear;
            {clear, 8'bx, 'bx}: nextState <= rec;
            default: nextState <= clear;
        endcase
    end

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