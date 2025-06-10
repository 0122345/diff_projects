cmake_minimum_required(VERSION 3.10)

# Correct project declaration
project(Basic_calc LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable
add_executable(calculator
    main.cpp
    calculator.cpp
)
