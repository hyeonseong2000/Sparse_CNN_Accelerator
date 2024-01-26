module buffercontrol (
  clk,
  reset,

  act_nz_count,
  act_read_enable,
  d_act_address,
  
  weight_nz_count,
  weight_read_enable,
  weight_address,

  run_mcc,
  done
);
  input clk, reset;
  
  input [7:0] act_nz_count;
  output reg act_read_enable;
  output reg[5:0] d_act_address; //act addressê°? read enable ?‹ ?˜¸ë³´ë‹¤ ?•œ?‹¸?´?´ ?” ë¹¨ë¦¬ ?‚˜???„œ ?•œ ?‹¸?´?´ ?”œ? ˆ?´
  reg [5:0] act_address;


  input [7:0] weight_nz_count;
  output reg weight_read_enable;
  output reg [5:0] weight_address;


  input run_mcc;

  output reg done;

  reg[1:0] state, next;


  parameter IDLE = 2'b00, RUN = 2'b01, W_DONE = 2'b10;

  
  reg act_done;
  reg weight_done;
  reg [7:0] reg_act_nz_count;
  reg [7:0] reg_weight_nz_count;
  reg count;


  always@(posedge clk) begin
    if(reset) begin
      d_act_address <= 0;
    end
    else begin
      d_act_address <= act_address;
    end
  end
  

    always@(posedge clk )begin
        if(reset) state <= IDLE;
        else state <= next;
    end


    always@(*)begin 
        
        case(state)

            IDLE : begin 
              if(run_mcc &(~count)) next <= RUN;
              else next <= IDLE; 
            end

            RUN : begin 
              if(weight_done) begin 
                next <= W_DONE;
                                 
              end
              else begin
                next <= RUN;
              end
            end
            
            W_DONE : begin 
              next <= IDLE;
            end

        endcase

    end
    
  always@(posedge clk)begin
    if(reset) count = 0;
    else begin
        if(run_mcc && (count == 0)) count = 1;
        else if(run_mcc && (count == 1)) count = 1;
        else count = 0;
    end
  end


  
  // buffer control signal part
  always @(posedge clk) begin
    if (reset) begin
      act_address <= 0;
      act_read_enable <= 0;
      
      weight_address <=0;
      weight_read_enable <= 0;
     
      act_done <= 0;
      weight_done <= 0;

      reg_act_nz_count <= 0;
      
      reg_weight_nz_count <= 0;
      
      
      done <= 0;
    end

    else begin
      case(state)


      IDLE : begin
        reg_act_nz_count <= act_nz_count;
        reg_weight_nz_count <= weight_nz_count;
        act_address <= 0;
        weight_address <= 0;
        act_read_enable <= 0;
        weight_read_enable <= 0;
        act_done <= 0;
        weight_done <= 0;
        done <= 0;
      end

      RUN : begin
        if (reg_act_nz_count == 0 ) begin
          reg_act_nz_count <= act_nz_count;
          act_done <= 1;
          act_read_enable <= 0;
          act_address <= 0;
        end
        else begin
          act_done <= 0;
          reg_act_nz_count <= reg_act_nz_count - 1 ;
          act_address <= act_address + 1;
          act_read_enable <= 1;
        end

        if (act_done) begin
          reg_weight_nz_count <= reg_weight_nz_count - 1;
          weight_address <= weight_address + 1;
          weight_read_enable <= 1;
        end

        else begin
          weight_address <= weight_address;
          weight_read_enable <= 0;
        end

        if(reg_weight_nz_count == weight_nz_count && reg_act_nz_count == act_nz_count)begin
          weight_read_enable <= 1;
        end

        if (reg_weight_nz_count == 1 && reg_act_nz_count == 0) begin
          weight_done <= 1;
          weight_read_enable <= 0;
        end
        else begin
          weight_done <= 0;
        end

        if (weight_done && act_done) begin
          act_read_enable <= 0;
          weight_read_enable <= 0;
          done <= 1;
        end
        
        

      end

      W_DONE : begin
        reg_act_nz_count <= 0;
        reg_weight_nz_count <= 0;
        act_address <= 0;
        weight_address <= 0;
        act_read_enable <= 0;
        weight_read_enable <= 0;
        weight_done <= 0;
        done <= 0;
      end

      endcase



    end
    
  end




endmodule