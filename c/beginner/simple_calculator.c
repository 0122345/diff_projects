#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <windows.h>

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

//GUI control Ids

#define ID_EDIT_DISPLAY 100
#define ID_BUTTON_0 101
#define ID_BUTTON_1 102
#define ID_BUTTON_2 103
#define ID_BUTTON_3 104
#define ID_BUTTON_4 105
#define ID_BUTTON_5 106
#define ID_BUTTON_6 107
#define ID_BUTTON_7 108
#define ID_BUTTON_8 109
#define ID_BUTTON_9 110
#define ID_BUTTON_ADD 111
#define ID_BUTTON_SUB 112
#define ID_BUTTON_MUL 113
#define ID_BUTTON_DIV 114
#define ID_BUTTON_EQ 115
#define ID_BUTTON_CLR 116
#define ID_BUTTON_HISTORY 117


//Global variables
HWND hEdit;
CalculationHistory* history;
double num1 = 0, num2 = 0, result = 0;
char operation = ' ';
int new_input = 1;

//init History

CalculationHistory* createHistory(int initialCapacity) {
   CalculationHistory* history = (CalculationHistory*)malloc(sizeof(CalculationHistory));
   if(!history) {
     // fprintf(stderr, "Memory allocation failed\n"); 
     MessageBox(NULL, "Memory allocation failed", "Error", MB_ICONERROR);
      exit(EXIT_FAILURE);
   }
   history -> records = (CalculationRecord*)malloc(initialCapacity * sizeof(CalculationRecord));
   if (!history->records) {
     // fprintf(stderr, "Memory allocation failed\n");
     MessageBox(NULL,"Memory allocation failed", "Error", MB_ICONERROR);
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
         //fprintf(stderr, "Memory reallocation failed \n");
         MessageBox(NULL, "Memory reallocation failed", "Error", MB_ICONERROR);
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



//printing calculation history without GUI
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

//generating/ printing history text GUI
char* getHistoryText(const CalculationHistory* history){
   //allocation memoty for history test by estimation size
   char* text = (char*)malloc(history->size * 50 + 100);
   if (!text) return NULL;

   strcpy(text, "===== Calculation HIstory ======\n");

   char line[100];
   for (int i = 0; i < history-> size; i++){
      CalculationRecord record = history->records[i];
      sprintf(line, "%d: %.2f %c %.2f = %.2f\r\n",
               i + 1,
               record.operand1,
               record.operation,
               record.operand2,
               record.result);
      strcat(text, line);
   }

   strcat(text, "==================================");
   return text;
}




//Function paradigm for calculations
double add(double a, double b) {
   return a + b;
}
double subtract(double a, double b) {
   return a - b;
}

double multiply(double a, double b){
   return a * b;
}

double divide(double a, double b) {
   if (b == 0) {
     // fprintf(stderr, "Error: division by zero \n");
     MessageBox(NULL, "Error: Division by zero", "Error", MB_ICONERROR);
      return 0;
   }
   return a / b;
}

//Function pointer type for operations
typedef double(*Operation) (double, double);

//high-order func to perform calculation
double calculate(double a, double b, Operation op){
   return op(a,b);
}

void handleNumberClick(HWND hwnd, int number){
   char current[256];
   char new_text[256];

   GetWindowText(hEdit, current, 256);

   if (new_input){
      sprintf(new_input, "%d", number);
      new_input = 0;
   } else {
      sprintf(new_text, "%s&d", current, number);
   }

   SetWindowText(hEdit, new_text);
}

//Function to handle operation button clicks
void HandleOperationClick(HWND hwnd, char op){
   char buffer[256];
   GetWindowText(hEdit, buffer, 256);

   num1 = atof(buffer);
   operation = op;
   new_input = 1;
}

// //getting nbrs from user
// void getNumbers(double* a, double* b){
//    printf("Enter first number: ");
//    scanf("%lf", a);

//    printf("Enter second number: ");
//    scanf("%lf", b);
// }


//Function to handle equals button click
void HandleEqualsClick(HWND hwnd){
   char buffer[256];
   GetWindowText(hEdit, buffer, 256);

   num2 = atof(buffer);
   Operation op_func;

   switch (operation) {
      case '+':
           op_func = add;
           break;
      case '-':
            op_func = subtract;
            break;
       case '*':
            op_func = multiply;
            break;
      case '/':
            if (num2 == 0) {
                SetWindowText(hEdit, "Error: Division by zero");
                return;
            }
            op_func = divide;
            break;
        default:
            return;
   }

   result = calculate(num1, num2, op_func);
   addToHistory(history, operation, num1, num2, result);
   sprintf(buffer, "%.2f", result);
   SetWindowText(hEdit, buffer);
   new_input = 1;
}

//Window procedure
LRESULT CALLBACK WnProc(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam) {
   switch(msg) {
      case WM_CREATE:
         //create display
         hEdit = CreateWindow("EDIT", "",
                  WS_CHIILD | WS_VISIBLE | WS_BORDER |
                  ES_RIGHT | ES_READONLY,
                  10, 10, 270, 30, hwnd,
                  (HMENU)ID_EDIT_DISPLAY, NULL, NULL);

                  CreateWindow("BUTTON", "8",
                     WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                     70, 50, 50, 50, hwnd, (HMENU)ID_BUTTON_8,
                     NULL, NULL);

                  CreateWindow("BUTTON", "9",
                     WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                     130, 50, 50, 50, hwnd,
                     (HMENU)ID_BUTTON_9, NULL, NULL
                  );
                  CreateWindow("BUTTON", "4", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                10, 110, 50, 50, hwnd, (HMENU)ID_BUTTON_4, NULL, NULL);
            
            CreateWindow("BUTTON", "5", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                70, 110, 50, 50, hwnd, (HMENU)ID_BUTTON_5, NULL, NULL);
            
            CreateWindow("BUTTON", "6", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                130, 110, 50, 50, hwnd, (HMENU)ID_BUTTON_6, NULL, NULL);
            
            CreateWindow("BUTTON", "1", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                10, 170, 50, 50, hwnd, (HMENU)ID_BUTTON_1, NULL, NULL);
            
            CreateWindow("BUTTON", "2", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                70, 170, 50, 50, hwnd, (HMENU)ID_BUTTON_2, NULL, NULL);
            
            CreateWindow("BUTTON", "3", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                130, 170, 50, 50, hwnd, (HMENU)ID_BUTTON_3, NULL, NULL);
            
            CreateWindow("BUTTON", "0", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                70, 230, 50, 50, hwnd, (HMENU)ID_BUTTON_0, NULL, NULL);
            
            // Create operation buttons
            CreateWindow("BUTTON", "+", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                190, 50, 50, 50, hwnd, (HMENU)ID_BUTTON_ADD, NULL, NULL);
            
            CreateWindow("BUTTON", "-", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                190, 110, 50, 50, hwnd, (HMENU)ID_BUTTON_SUB, NULL, NULL);
            
            CreateWindow("BUTTON", "*", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                190, 170, 50, 50, hwnd, (HMENU)ID_BUTTON_MUL, NULL, NULL);
            
            CreateWindow("BUTTON", "/", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                190, 230, 50, 50, hwnd, (HMENU)ID_BUTTON_DIV, NULL, NULL);
            
            CreateWindow("BUTTON", "=", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                130, 230, 50, 50, hwnd, (HMENU)ID_BUTTON_EQ, NULL, NULL);
            
            CreateWindow("BUTTON", "C", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                10, 230, 50, 50, hwnd, (HMENU)ID_BUTTON_CLR, NULL, NULL);
            
            CreateWindow("BUTTON", "History", 
                WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
                10, 290, 230, 30, hwnd, (HMENU)ID_BUTTON_HISTORY, NULL, NULL);
            
            break;
            
        case WM_COMMAND:
            switch(LOWORD(wParam)) {
                case ID_BUTTON_0:
                    HandleNumberClick(hwnd, 0);
                    break;
                case ID_BUTTON_1:
                    HandleNumberClick(hwnd, 1);
                    break;
                case ID_BUTTON_2:
                    HandleNumberClick(hwnd, 2);
                    break;
                case ID_BUTTON_3:
                    HandleNumberClick(hwnd, 3);
                    break;
                case ID_BUTTON_4:
                    HandleNumberClick(hwnd, 4);
                    break;
                case ID_BUTTON_5:
                    HandleNumberClick(hwnd, 5);
                    break;
                case ID_BUTTON_6:
                    HandleNumberClick(hwnd, 6);
                    break;
                case ID_BUTTON_7:
                    HandleNumberClick(hwnd, 7);
                    break;
                case ID_BUTTON_8:
                    HandleNumberClick(hwnd, 8);
                    break;
                case ID_BUTTON_9:
                    HandleNumberClick(hwnd, 9);
                    break;
                case ID_BUTTON_ADD:
                    HandleOperationClick(hwnd, '+');
                    break;
                case ID_BUTTON_SUB:
                    HandleOperationClick(hwnd, '-');
                    break;
                case ID_BUTTON_MUL:
                    HandleOperationClick(hwnd, '*');
                    break;
                case ID_BUTTON_DIV:
                    HandleOperationClick(hwnd, '/');
                    break;
                case ID_BUTTON_EQ:
                    HandleEqualsClick(hwnd);
                    break;
                case ID_BUTTON_CLR:
                    SetWindowText(hEdit, "");
                    num1 = num2 = result = 0;
                    operation = ' ';
                    break;
                case ID_BUTTON_HISTORY:
                    char* historyText = getHistoryText(history);
                    if (historyText) {
                        MessageBox(hwnd, historyText, "Calculation History", MB_OK);
                        free(historyText);
                    }
                    break;
            }
            break;
            
        case WM_CLOSE:
            DestroyWindow(hwnd);
            break;
            
        case WM_DESTROY:
            freeHistory(history);
            PostQuitMessage(0);
            break;
            
        default:
            return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
   }

   int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    // Initialize calculation history
    history = createHistory(10);
    
    WNDCLASSEX wc;
    HWND hwnd;
    MSG msg;
    
    // Register window class
    wc.cbSize        = sizeof(WNDCLASSEX);
    wc.style         = 0;
    wc.lpfnWndProc   = WndProc;
    wc.cbClsExtra    = 0;
    wc.cbWndExtra    = 0;
    wc.hInstance     = hInstance;
    wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = "CalculatorClass";
    wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);
    
    if(!RegisterClassEx(&wc)) {
        MessageBox(NULL, "Window Registration Failed!", "Error", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    
    // Create window
    hwnd = CreateWindowEx(
        WS_EX_CLIENTEDGE,
        "CalculatorClass",
        "Simple Calculator with History",
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT, 300, 370,
        NULL, NULL, hInstance, NULL);
    
    if(hwnd == NULL) {
        MessageBox(NULL, "Window Creation Failed!", "Error", MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    
    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);
    
    // Message loop
    while(GetMessage(&msg, NULL, 0, 0) > 0) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    
    return msg.wParam;
}




//main calc this was before GUI if you don't want GUI uncomment this
// void runCalculator(CalculationHistory* history) {
//    int choice;
//    double num1, num2, result;
//    char op;
//    bool running = true;
   
//    while (running) {
//       printf("\n===== Simple Calculator =====\n");
//         printf("1. Addition\n");
//         printf("2. Subtraction\n");
//         printf("3. Multiplication\n");
//         printf("4. Division\n");
//         printf("5. View History\n");
//         printf("6. Exit\n");
//         printf("Enter your choice (1-6): ");
//         scanf("%d", &choice);

//         switch (choice) {
//          case 1: 
//               getNumbers(&num1, &num2);
//               result = calculate(num1, num2, add);
//               op = '+';
//               printf("%.2f + %.2f = %.2f\n", num1, num2, result);
//               addToHistory(history, op, num1, num2, result);
//               break;
//          case 2:
//                 getNumbers(&num1, &num2);
//                 result = calculate(num1, num2, substract);
//                 op = '-';
//                 printf("%.2f - %.2f = %.2f\n", num1, num2, result);
//                 addToHistory(history, op, num1, num2, result);
//                 break;
                
//          case 3:
//                 getNumbers(&num1, &num2);
//                 result = calculate(num1, num2, multiply);
//                 op = '*';
//                 printf("%.2f * %.2f = %.2f\n", num1, num2, result);
//                 addToHistory(history, op, num1, num2, result);
//                 break;
                
//          case 4:
//                 getNumbers(&num1, &num2);
//                 if (num2 != 0) {
//                     result = calculate(num1, num2, divide);
//                     op = '/';
//                     printf("%.2f / %.2f = %.2f\n", num1, num2, result);
//                     addToHistory(history, op, num1, num2, result);
//                 } else {
//                     printf("Error: Division by zero\n");
//                 }
//                 break;
                
//          case 5:
//                 printHistory(history);
//                 break;
                
//          case 6:
//                 running = false;
//                 printf("Thank you for using the calculator!\n");
//                 break;

//             default:
//                 printf("Invalid choice\n");
//         }
//    }
// }

//we have winmain instead
// int main() {
//    //init calculation history
//    CalculationHistory* history = createHistory(10);

//    //reun the calculation
//    runCalculator(history);

//    //clean up memory
//    freeHistory(history);
// }