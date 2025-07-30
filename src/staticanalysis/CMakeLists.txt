cmake_minimum_required(VERSION 3.13.4)
project(DMACallFinder)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set your project compile flags.
# E.g. if using the C++ header files
# you will need to enable C++11 support
# for your compiler.

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST UNIX_COMMAND "${LLVM_DEFINITIONS}")
add_definitions(${LLVM_DEFINITIONS_LIST})

# Now build our tools
add_library(DMACallFinder MODULE DMACallFinder.cpp)

# Use C++14 to compile our pass (this is required by LLVM).
target_compile_features(DMACallFinder PRIVATE cxx_std_14)

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(DMACallFinder PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(DMACallFinder PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
endif(APPLE)