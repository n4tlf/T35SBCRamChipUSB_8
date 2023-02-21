/************************************************************************
*   File:  portDecoder.v    TFOX    Ver 0.1     Oct.12, 2022            *
*
************************************************************************/


module portDecoder
    (
//    input           clock,
    input [7:0]     address,
    input           iowrite,
    input           ioread,
    //
    output          outPortFF_cs,
    output          inPortCon_cs,
    output          outFbarLEDs_cs,
    output          inFbarLEDs_cs,
    output          outMiscCtl_cs,
    output          inIOBYTE_cs,
    output          outRAMA16_cs, 
     output          inUSBst_cs,
    output          inusbRxD_cs,
    output          outusbTxD_cs 
   );

    assign outPortFF_cs = (address[7:0] == 8'hff) && iowrite;
    assign inPortCon_cs = (address[7:1] == 7'h00) && ioread;
    assign outFbarLEDs_cs = (address[7:0] == 8'h06) && iowrite; // Port 06 write
    assign inFbarLEDs_cs = (address[7:0] == 8'h06) && ioread;  // port 06 read
    assign outMiscCtl_cs = (address[7:0] == 8'h07) && iowrite; // Port 07 out
    assign inIOBYTE_cs = (address[7:0] == 8'h36) && ioread;    // IN = IOBYTE(switches)
    assign outRAMA16_cs = (address[7:0] == 8'h36) && iowrite;  // Out 36 D0 = RAM A16
    assign inUSBst_cs   = (address[7:0] == 8'h34) && ioread;  // input USB status port
    assign inusbRxD_cs  = (address[7:0] == 8'h35) && ioread;  // USB UART Rx Data input
    assign outusbTxD_cs = (address[7:0] == 8'h35) && iowrite; // USB UART Tx Data output
 
    endmodule
