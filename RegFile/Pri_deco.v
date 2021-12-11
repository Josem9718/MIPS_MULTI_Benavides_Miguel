// MIGUEL BENAVIDES
// Decodificador de Prioridad.

module Pri_deco(

input [4:0] Wregister,
output reg [31:0] out

);

always @(*) begin

	case(Wregister)
		
		0: out = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		1: out = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		2: out = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
		3: out = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
		4: out = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
		5: out = 32'b0000_0000_0000_0000_0000_0000_0010_0000;
		6: out = 32'b0000_0000_0000_0000_0000_0000_0100_0000; 
		7: out = 32'b0000_0000_0000_0000_0000_0000_1000_0000;
		8: out = 32'b0000_0000_0000_0000_0000_0001_0000_0000;
		9: out = 32'b0000_0000_0000_0000_0000_0010_0000_0000;
		10: out = 32'b0000_0000_0000_0000_0000_0100_0000_0000;
		11: out = 32'b0000_0000_0000_0000_0000_1000_0000_0000;
		12: out = 32'b0000_0000_0000_0000_0001_0000_0000_0000;
		13: out = 32'b0000_0000_0000_0000_0010_0000_0000_0000;
		14: out = 32'b0000_0000_0000_0000_0100_0000_0000_0000;
		15: out = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
		16: out = 32'b0000_0000_0000_0001_0000_0000_0000_0000;
		17: out = 32'b0000_0000_0000_0010_0000_0000_0000_0000;
		18: out = 32'b0000_0000_0000_0100_0000_0000_0000_0000;
		19: out = 32'b0000_0000_0000_1000_0000_0000_0000_0000;
		20: out = 32'b0000_0000_0001_0000_0000_0000_0000_0000;
		21: out = 32'b0000_0000_0010_0000_0000_0000_0000_0000;
		22: out = 32'b0000_0000_0100_0000_0000_0000_0000_0000;
		23: out = 32'b0000_0000_1000_0000_0000_0000_0000_0000;
		24: out = 32'b0000_0001_0000_0000_0000_0000_0000_0000;
		25: out = 32'b0000_0010_0000_0000_0000_0000_0000_0000;
		26: out = 32'b0000_0100_0000_0000_0000_0000_0000_0000;
		27: out = 32'b0000_1000_0000_0000_0000_0000_0000_0000;
		28: out = 32'b0001_0000_0000_0000_0000_0000_0000_0000;
		29: out = 32'b0010_0000_0000_0000_0000_0000_0000_0000;
		30: out = 32'b0100_0000_0000_0000_0000_0000_0000_0000;
		31: out = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
	endcase
end

endmodule 