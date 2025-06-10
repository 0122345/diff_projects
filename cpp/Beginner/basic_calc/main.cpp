 #include <iostream>
 #include "calculator.h"

 // main.cpp
#include <iostream>
#include "calculator.h"

int main() {
    Calculator calc;
    int choice;
    double a, b;

    do {
        calc.displayMenu();
        std::cout << "Enter choice: ";
        std::cin >> choice;

        if (choice >= 1 && choice <= 4) {
            std::cout << "Enter two numbers: ";
            std::cin >> a >> b;
            calc.setNumbers(a, b);
        }

        switch (choice) {
            case 1:
                std::cout << "Result: " << calc.add() << std::endl;
                break;
            case 2:
                std::cout << "Result: " << calc.subtract() << std::endl;
                break;
            case 3:
                std::cout << "Result: " << calc.multiply() << std::endl;
                break;
            case 4:
                std::cout << "Result: " << calc.divide() << std::endl;
                break;
            case 5:
                std::cout << "Exiting..." << std::endl;
                break;
            default:
                std::cout << "Invalid choice.\n";
        }
    } while (choice != 5);

    return 0;
}
