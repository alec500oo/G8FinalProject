module KeyboardDriver (input logic clk, // Clock driven by device
                       input logic data, // Data in (serially driven)
                       input logic reset_n, // Reset active LOW
                       output logic[7:0] code, // Output code
                       output logic ext, // Extended key code (Arrow, Ctrl...)
                       output logic back); // "Back" received, key released.
    logic[9:0] storageRegister;


    // Split the storage regitser into the output lines.
    assign ext = storageRegister[9];
    assign back = storageRegister[8];
    assign code = storageRegister[7:0];
endmodule