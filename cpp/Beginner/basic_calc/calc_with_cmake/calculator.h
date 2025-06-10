// calculator.h
#ifndef CALCULATOR_H
#define CALCULATOR_H

class Calculator {
private:
    double num1;
    double num2;

public:
    // Constructor
    Calculator(double a = 0, double b = 0);

    // Setters
    void setNumbers(double a, double b);

    // Operations
    double add();
    double subtract();
    double multiply();
    double divide();

    // Utility
    void displayMenu();
};

#endif
