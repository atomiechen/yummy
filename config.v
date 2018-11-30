`define ADDIU 	5'b01001
`define ADDIU3 	5'b01000
`define ADDSP	5'b01100
`define ADDU 	5'b11100
`define AND 	5'b11101
`define BB 	    5'b00010
`define BEQZ	5'b00100
`define BNEZ	5'b00101
`define BTEQZ	5'b01100
`define CMP 	5'b11101
`define JR 	    5'b11101
`define LI	    5'b01101
`define LW	    5'b10011
`define LW_SP 	5'b10010
`define MFIH 	5'b11110
`define MFPC 	5'b11101
`define MTIH 	5'b11110
`define MTSP 	5'b01100
`define NOP 	5'b00001
`define NOT 	5'b11101
`define OR 	    5'b11101
`define SLL	    5'b00110
`define SLLV	5'b11101
`define SRA	    5'b00110
`define SRLV	5'b11101
`define SUBU	5'b11100
`define SW_RS	5'b01100
`define SW_SP	5'b11010
`define SW	5'b11011

`define add_ctr 4'b0001
`define sub_ctr 4'b0010
`define and_ctr 4'b0011
`define or_ctr  4'b0100
`define no_ctr  4'b0101
`define sll_ctr 4'b0110
`define sra_ctr 4'b0111
`define add_sub 4'b1000
`define sll_sra 4'b1001
`define no_alu_op 4'b1010

`define rxry 3'b000
`define ryEqualZero 3'b001
`define rxEqualSP 3'b010
`define rxZeroryIH 3'b011
//sp ih ra t pc

`define REG0 4'b0000
`define SP 4'b1000
`define IH 4'b1001
`define RA 4'b1010
`define T 4'b1011
`define PC 4'b1100

`define B 2'b00
`define BNE 2'b01
`define BE 2'b10
`define NB 2'b11

`define IM11 3'b000
`define IM8 3'b001
`define IM4 3'b010
`define IM0 3'b011
`define IM3 3'b100
`define IM5 3'b101
`define IM_TO8 3'b110

