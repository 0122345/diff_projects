#include <iostream>
#include "calculator.h"

int main() {
    Calculator calc;
    int choice = 0;
    double a = 0, b = 0;

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
                std::cout << "Result: " << calc.add() << "\n";
                break;
            case 2:
                std::cout << "Result: " << calc.subtract() << "\n";
                break;
            case 3:
                std::cout << "Result: " << calc.multiply() << "\n";
                break;
            case 4:
                std::cout << "Result: " << calc.divide() << "\n";
                break;
            case 5:
                std::cout << "Exiting.\n";
                break;
            default:
                std::cout << "Invalid choice.\n";
        }
    } while (choice != 5);

    return 0;
}
