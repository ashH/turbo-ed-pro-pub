
module huc_nom(//no mapper

	input  HucIn  huc_i,
	output HucOut huc_o
);
	wire clk;
	CpuBus cpu;
	MemCtrl rom;
	MemCtrl ram;
	
	assign clk 			= huc_i.clk;
	assign cpu 			= huc_i.cpu;	
	
	assign huc_o.rom 	= rom;
	assign huc_o.ram 	= ram;
	
	assign huc_o.cart_ce		= rom.ce | ram.ce;
	assign huc_o.cart_dato	= rom.ce ? huc_i.rom_dato : huc_i.ram_dato;
//************************************************************************************* 
	
	assign rom.dati	= cpu.data;
	assign rom.addr	= cpu.addr[19:0];
	assign rom.ce2		= cpu.ce;
	assign rom.ce		= cpu.addr[20] == 0;
	assign rom.oe		= cpu.oe;
	assign rom.we		= 0;
	
	
	assign huc_o.led	= ctr[24];
	
	reg [24:0]ctr;
	
	always @(posedge clk)
	begin
		ctr	<= ctr + 1;
	end
	
endmodule
