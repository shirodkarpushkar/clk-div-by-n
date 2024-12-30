module div_by_n(
    input clk, rst,
    output reg out
);  

    parameter int div_value = 5;
    int counter;
    int divider = div_value - 1;
    reg posedge_sig;
    reg negedge_sig;
    
    /* flop */
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            counter <= 0;
        end else begin
            if (counter == divider) begin
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
        
    end

    /* posedge clk */
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            posedge_sig <= 1'b0;
        end else begin
            if (counter == (divider >> 1) ) begin
                posedge_sig <= 1'b1;
            end else if (counter == divider )  begin
                posedge_sig <= 1'b0;
            end
        end
    end

    /* negedge signal is delayed version of posedge signal */
    always @(negedge clk or negedge rst) begin
        if (!rst) begin
            negedge_sig <= 1'b0;
        end else begin
            negedge_sig <= posedge_sig;
        end
    end

    assign out = posedge_sig | negedge_sig;


endmodule