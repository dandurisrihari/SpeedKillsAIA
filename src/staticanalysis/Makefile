# Makefile for LLVM Function Analyzer Pass
# Compatible with LLVM/Clang 18.1.3

CXX = clang++
LLVM_CONFIG = llvm-config

# Get LLVM compilation flags
LLVM_CXXFLAGS := $(shell $(LLVM_CONFIG) --cxxflags)
LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
LLVM_LIBS := $(shell $(LLVM_CONFIG) --libs)

# Additional flags
CXXFLAGS = $(LLVM_CXXFLAGS) -fPIC -std=c++17 -O2
LDFLAGS = $(LLVM_LDFLAGS)
LIBS = $(LLVM_LIBS) -lLLVM

# Target executable
TARGET = functionsanalyzer
SOURCE = functionsanalyazer.cpp

# Default target
all: $(TARGET)

# Build the analyzer
$(TARGET): $(SOURCE)
	$(CXX) $(CXXFLAGS) $(SOURCE) $(LDFLAGS) $(LIBS) -o $(TARGET)

# Clean build artifacts
clean:
	rm -f $(TARGET)

# Test with a sample LLVM IR file (if galcore.ll exists)
test: $(TARGET)
	@if [ -f galcore.ll ]; then \
		echo "Running function analyzer on galcore.ll..."; \
		./$(TARGET) galcore.ll; \
	else \
		echo "galcore.ll not found. Usage: ./$(TARGET) <llvm-ir-file>"; \
	fi

# Create a simple test LLVM IR file for demonstration
create-test:
	@echo "Creating a simple test LLVM IR file..."; \
	echo '; Simple test LLVM IR file' > test.ll; \
	echo 'define i32 @main() {' >> test.ll; \
	echo '  ret i32 0' >> test.ll; \
	echo '}' >> test.ll; \
	echo '' >> test.ll; \
	echo 'declare void @printf(i8*)' >> test.ll; \
	echo '' >> test.ll; \
	echo 'define void @test_function(i32 %arg) {' >> test.ll; \
	echo '  ret void' >> test.ll; \
	echo '}' >> test.ll; \
	echo "Created test.ll - you can run: ./$(TARGET) test.ll"

# Install LLVM development packages (Ubuntu/Debian)
install-deps:
	@echo "Installing LLVM development dependencies..."
	sudo apt-get update
	sudo apt-get install -y llvm-18-dev libllvm18 llvm-18-tools clang-18

# Show LLVM configuration
show-config:
	@echo "LLVM Configuration:"
	@echo "Version: $$($(LLVM_CONFIG) --version)"
	@echo "CXX Flags: $(LLVM_CXXFLAGS)"
	@echo "LD Flags: $(LLVM_LDFLAGS)"
	@echo "Libraries: $(LLVM_LIBS)"

.PHONY: all clean test create-test install-deps show-config
