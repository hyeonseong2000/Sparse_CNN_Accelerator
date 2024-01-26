module data_switch(reset, data, en, max, data_out0, data_out1, done);
    input [15:0] data;
    input en, reset;
    input [7:0] max;
    output reg [16:0] data_out0;
    output reg [16:0] data_out1;
    output reg done;
    
    reg switch;
    reg [7:0] count = 0;
    initial begin
        done <= 0;
    end
    always@(posedge en or posedge reset) begin
        if(reset) begin
            count <= 0;
            done <= 0;
            data_out0 <= 0;
            data_out1 <= 0; 
            switch <= 0;
        end
        else begin
            if(count < max) begin
                if(switch == 0)begin
                    data_out0 <= {1'b1, data};
                    data_out1 <= 0;
                    switch <= 1;
                    count <= count + 1;
                    if(count == max - 1) done <= 1;
                    else done <= 0;

                end
                else begin
                    data_out0 <= 0;
                    data_out1 <= {1'b1, data};
                    switch <= 0;
                    count <= count + 1;
                    if(count == max - 1) done <= 1;
                    else done <= 0;
                    
                end
            end
            else begin
                data_out0 <= 0;
                data_out1 <= 0; 
                count <= 0;
                if(count != 0)done <= 1;
                else done <= 0;
            end
        end
    end
endmodule