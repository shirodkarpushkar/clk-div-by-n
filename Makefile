# Makefile to compile p_26_div_by_n.sv and top.sv
VERILOG_SRC = $(wildcard ./rtl/*.sv)
TESTBENCH_SRC = $(wildcard ./testbench/*.sv)
# Source files
SRC = $(VERILOG_SRC) $(TESTBENCH_SRC)


# Default target
all: compile

# Compile target
compile:
	vlog $(SRC) 

# Clean target
clean:
	rm -rf work *.wlf transcript

simulate:
	vsim -i -classdebug -msgmode both -do "set NoQuitOnFinish 1; do wave.do; run -all" top

debug: compile  simulate
