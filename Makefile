# Makefile to compile p_26_div_by_n.sv and top.sv
VERILOG_SRC = $(wildcard ./rtl/*.sv)
TESTBENCH_SRC = $(wildcard ./testbench/*.sv)
# Source files
SRC = $(VERILOG_SRC) $(TESTBENCH_SRC)


# Default target
all: compile

optimize:
	vopt +acc top -o optimized_debug_top_tb

# Compile target

compile_src:
	vlog $(SRC)

compile: compile_src optimize
# Clean target
clean:
	rm -rf work *.wlf transcript

simulate:
	vsim -i -classdebug -msgmode both -do "set NoQuitOnFinish 1; do wave.do; run -all" optimized_debug_top_tb

debug: compile  simulate
