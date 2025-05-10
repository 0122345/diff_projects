#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

// Memory management  - dynamic array for calculator history
typedef struct {
   char operation;
   double operand1;
   double operand2;
   double result; 
} CalculationRecord;

typedef struct {
   CalculationRecord* records;
   int capacity;
   int size;
} CalculationHistory;

//init History

CalculationHistory* createHistory(int initialCapacity) {
   CalculationHistory* history = (CalculationHistory*)malloc(sizeof(CalculationHistory));
   if(!history) {
      fprintf(stderr, "Memory allocation failed\n");
      exit(EXIT_FAILURE);
   }
   history -> records = (CalculationRecord*)malloc(initialCapacity * sizeof(CalculationRecrd));
   if (!history->records) {
      fprintf(stderr, "Memory allocation failed\n");
      free(history);
      exit(EXIT_FAILURE);
   }
   history->capacity = initialCapacity;
   history-> size = 0;
   return history;
}

//add record to history with dynamic resizing
void addToHistory(CalculationHistory* history, char op, double a, double b, double result) {
   if(history-> size >= history->capacity) {
      int newCapacity = history->capacity * 2;
      CalculationRecord* newRecords = (CalculationRecord*)realloc(history->records, newCapacity * sizeof(CalculationRecord));
      if (!newRecords){
         fprintf(stderr, "Memory reallocation failed \n");
         return;
      }
      history->records = newRecords;
      history->capacity = newCapacity;
   }

   history->records[history->size].operation = op;
   history->records[history->size].operand1 = a;
   history->records[history->size].operand2 = b;
   history->records[history->size].result = result;
   history->size++;
}


//freeing history memeory

void freeHistory(CalculationHistory* history){
   if(history) {
      free(history ->records);
      free(history);
   }
}

//printing calculation history

void printHistory(const CalculationHistory* history){
   printf("\n\n==== Calculation History === \n\n");
   for (int i = 0; i < history-> size; i++){
      CalculationRecord record = history->records[i];
      printf("%d: %.2f %c %.2f = %.2f\n",
      i + 1,
      record.operand1,
      record.operation,
      record.operand2,
      record.result);
   }
   printf("============================\n");
}

//Function paradigm for calculations

double add(double a, double b) {
   return a + b;
}
double substract(double a, double b) {
   return a - b;
}

double multiply(double a, double b){
   return a * b;
}

double divide(double a, double b) {
   if (b == 0) {
      fprintf(stderr, "Error: division by zero \n");
      return 0;
   }
   return a / b;
}

//Function pointer type for operations
typedef double(*Operation) (double, double);

//high-order func to perform calculation

double calculate(double a, double b, OPeration op){
   return op(a,b);
}

//getting nbrs from user

void getNumbers(double* a, double* b){
   printf("Enter first number: ");
   scanf("%lf", a);

   printf("Enter second number: ");
   scanf("%lf", b);
}

//main calc
void runCalculator(CalculationHistory* history) {
   int choice;
   double num1, num2, result;
   char op;
   bool running = true;
   
   while (running) {
      printf("\n===== Simple Calculator =====\n");
        printf("1. Addition\n");
        printf("2. Subtraction\n");
        printf("3. Multiplication\n");
        printf("4. Division\n");
        printf("5. View History\n");
        printf("6. Exit\n");
        printf("Enter your choice (1-6): ");
        scanf("%d", &choice);

        switch (choice) {
         case 1: 
              getNumbers(&num1, &num2);
              result = calculate(num1, num2, add);
              op = '+';
              printf("%.2f + %.2f = %.2f\n", num1, num2, result);
              addToHistory(history, op, num1, num2, result);
              break;
         case 2:
                getNumbers(&num1, &num2);
                result = calculate(num1, num2, substract);
                op = '-';
                printf("%.2f - %.2f = %.2f\n", num1, num2, result);
                addToHistory(history, op, num1, num2, result);
                break;
                
            case 3:
                getNumbers(&num1, &num2);
                result = calculate(num1, num2, multiply);
                op = '*';
                printf("%.2f * %.2f = %.2f\n", num1, num2, result);
                addToHistory(history, op, num1, num2, result);
                break;
                
            case 4:
                getNumbers(&num1, &num2);
                if (num2 != 0) {
                    result = calculate(num1, num2, divide);
                    op = '/';
                    printf("%.2f / %.2f = %.2f\n", num1, num2, result);
                    addToHistory(history, op, num1, num2, result);
                } else {
                    printf("Error: Division by zero\n");
                }
                break;
                
            case 5:
                printHistory(history);
                break;
                
            case 6:
                running = false;
                printf("Thank you for using the calculator!\n");
                break;

            default:
                printf("Invalid choice\n");
        }
   }
}


int main() {
   //init calculation history
   CalculationHistory* history = createHistory(10);

   //reun the calculation
   runCalculator(history);

   //clean up memory
   freeHistory(history);
}