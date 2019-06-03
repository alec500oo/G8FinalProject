`include "../keyboardDriver.sv"
module keyboardTestbench ();
    logic clk, reset_n, data;
    logic[7:0] out_code;

    KeyboardDriver dut(.clk(clk),
                       .data(data),
                       .reset_n(reset_n),
                       .code(out_code));
    initial begin
        clk = 0;
        reset_n = 0;
        data = 0;
        out_code = 0;
    end

    initial begin
        #10 reset_n = 1;
    end

    
    logic[10:0] testDat1 = 11'b00011100001; // Good data
    logic[10:0] testDat2 = 11'b00010100011; // Good Data
    logic[10:0] testDat3 = 11'b00011100011; // Bad data
    initial begin
        #10;
        for (int i = 10; i >= 0; i--) begin
            @(posedge clk);
            data = testDat1[i];
        end
        for (int i = 10; i >= 0; i--) begin
            @(posedge clk);
            data = testDat2[i];
        end
        for (int i = 10; i >= 0; i--) begin
            @(posedge clk);
            data = testDat3[i];
        end
    end

    always
        #10 clk = !clk;

    initial
        #1600 $finish;

endmodule