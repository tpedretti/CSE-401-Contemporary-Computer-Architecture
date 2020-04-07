`timescale 1ns / 1ps
/*  reg.v  */
module register(
    input   [4:0]   rs,
    input   [4:0]   rt,
    input   [4:0]   rd,
    input   [31:0]  writedata,
    input           regwrite,
    output reg  [31:0]  A,
    output reg  [31:0]  B
    );

// Register Declaration
reg [31:0] REG [0:31]; //gives us 32 registers, each 32 bits long
    
integer i;
    
initial 
begin
        
        A <= 0;
        B <= 0;
          
          //initialize our registers
          for (i = 0; i < 32; i = i + 1)
                REG[i] <= 0;
        #10;
     //display contents of the first 9 reigsters
     $display("From Register Memory:");
         for (i = 0; i < 9; i = i + 1)
             $display("\tREG[%0d] = %0d",i,REG[i]);
        
        //Display last register
          $display("\t...");
          $display("\tREG[%0d] = %0d", 31, REG[31]);
end
    
always @ * 
begin
      A <= REG[rs]; // Assign the rs index of REG to A ;
      B <= REG[rt]; // Assign the __ index of REG to B ;
        
        // WRITE data using index rd
          if (regwrite)
            REG[rd] <= writedata;
    
end
endmodule // register

// 002300AA
// 10654321
// 00100022
// 8C123456
// 8F123456
// AD654321
// 13012345
// AC654321
// 12012345
