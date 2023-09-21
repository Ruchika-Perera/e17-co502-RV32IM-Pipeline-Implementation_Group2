/////////////////////////////////////////////
// Advanced Computer Architecture (CO502)  //
// Design : ALU Module                     // 
// Group  : 2                              //
/////////////////////////////////////////////

`timescale 1ns/100ps


module EX_MEM_pipeline (
    CLK, RESET, 

    EX_PC, EX_ALU_OUT, EX_REG_DATA2,
    EX_REG_WRITE_ADDR, EX_REG_READ_ADDR2, EX_REG_WRITE_EN, 
    EX_DATA_MEM_WRITE, EX_DATA_MEM_READ, EX_WB_VALUE_SELECT,

    MEM_PC, MEM_ALU_OUT, MEM_REG_DATA2,
    MEM_REG_WRITE_ADDR, MEM_REG_READ_ADDR2, MEM_REG_WRITE_EN,
    MEM_DATA_MEM_WRITE, MEM_DATA_MEM_READ, MEM_WB_VALUE_SELECT
);

    input CLK, RESET;

    input [31:0] EX_PC, EX_ALU_OUT, EX_REG_DATA2;
    input [4:0] EX_REG_WRITE_ADDR, EX_REG_READ_ADDR2;
    input EX_REG_WRITE_EN;
    input [3:0] EX_DATA_MEM_READ;
    input [2:0] EX_DATA_MEM_WRITE;
    input [1:0] EX_WB_VALUE_SELECT;

    output reg [31:0] MEM_PC, MEM_ALU_OUT, MEM_REG_DATA2;
    output reg [4:0] MEM_REG_WRITE_ADDR, MEM_REG_READ_ADDR2;
    output reg MEM_REG_WRITE_EN;
    output reg [3:0] MEM_DATA_MEM_READ;
    output reg [2:0] MEM_DATA_MEM_WRITE;
    output reg [1:0] MEM_WB_VALUE_SELECT;

    always @ (posedge CLK)
    begin
        
        if (RESET == 1'b1)
        begin
            MEM_PC <= #0.1 32'b0;
            MEM_ALU_OUT <= #0.1 32'b0;
            MEM_REG_DATA2 <= #0.1 32'b0;
            MEM_REG_WRITE_ADDR <= #0.1 4'b0;
            MEM_REG_READ_ADDR2 <= #0.1 4'b0;
            MEM_REG_WRITE_EN <= #0.1 1'b0;
            MEM_DATA_MEM_WRITE <= #0.1 3'b0;
            MEM_DATA_MEM_READ <= #0.1 4'b0;
            MEM_WB_VALUE_SELECT <= #0.1 2'b0;
        end
        else
        begin
            MEM_PC <= #0.1 EX_PC;
            MEM_ALU_OUT <= #0.1 EX_ALU_OUT;
            MEM_REG_DATA2 <= #0.1 EX_REG_DATA2;
            MEM_REG_WRITE_ADDR <= #0.1 EX_REG_WRITE_ADDR;
            MEM_REG_READ_ADDR2 <= #0.1 EX_REG_READ_ADDR2;
            MEM_REG_WRITE_EN <= #0.1 EX_REG_WRITE_EN;
            MEM_DATA_MEM_WRITE <= #0.1 EX_DATA_MEM_WRITE;
            MEM_DATA_MEM_READ <= #0.1 EX_DATA_MEM_READ;
            MEM_WB_VALUE_SELECT <= #0.1 EX_WB_VALUE_SELECT;
        end
    end
    
endmodule