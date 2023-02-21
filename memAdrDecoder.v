/****************************************************************************
*   File:   memAdrDecoder.V     TFOX    Ver 0.1     Oct. 12, 2022           *
*   Memory Address Decoder  For Monanahan S100 Z80 FPGA SBC                 *                                    
*   TFOX, N4TLF January 20, 2023   You are free to use it                   *
*       however you like.  No warranty expressed or implied                 *
*       This is a VERY BASIC ROM, It only verifies OUTPUT instruction works *
****************************************************************************/

module memAdrDecoder
    (
//    input           clock,
    input [15:12]    address,       // change to [15:9] for small ROM (prj6)
    input           memwrite,
    input           memread,
    input           reset_cs,
   //
    output          rom_cs,     // rom_cs is high to select ROM
    output          ram_cs
     );
 
// wire   romAdr;
 
//    assign romAdr = (address[15:12] == 4'b0000);
//    assign rom_cs = (address[15:9] == 7'b0000000) && memread;   // Prj 6
    assign rom_cs = (address[15:12] == 4'b1111) && memread;       // PRJ 6A    

    assign ram_cs = !rom_cs && (memwrite | memread) && reset_cs;
//    assign ram_cs = !romAdr && (memwrite | memread);

    
endmodule
