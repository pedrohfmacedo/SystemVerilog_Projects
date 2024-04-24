package floatpkg;
//The adder accept inputs floanting point format (single precision), in other words (32-bits)
//1-bit signal, for (1'b1 for negative)
//4-bits exponents
//23-bits fraction
typedef struct packed {
	logic signal;
	logic [7:0] exponent;
	logic [22:0]fraction;
}float_t;

endpackage: floatpkg
