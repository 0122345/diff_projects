// calculator.cpp
#include <iostream>
#include "calculator.h"

Calculator::Calculator(double a, double b) {
    num1 = a;
    num2 = b;
}

void Calculator::setNumbers(double a, double b) {
    num1 = a;
    num2 = b;
}

double Calculator::add() {
    return num1 + num2;
}

double Calculator::subtract() {
    return num1 - num2;
}

double Calculator::multiply() {
    return num1 * num2;
}

double Calculator::divide() {
    if (num2 == 0) {
        std::cerr << "Error: Division by zero." << std::endl;
        return 0;
    }
    return num1 / num2;
}

void Calculator::displayMenu() {
    std::cout << "\nCalculator Menu:\n";
    std::cout << "1. Add\n";
    std::cout << "2. Subtract\n";
    std::cout << "3. Multiply\n";
    std::cout << "4. Divide\n";
    std::cout << "5. Exit\n";
}
