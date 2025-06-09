//Main loop


#include <stdio.h>
#include <stdlib.h>
#include "todo.h"

int main() {
     char tasks[MAX_TASKS][MAX_LENGTH];
     int taskCount = 0;
     int choice;

     loadTasksFromFile(tasks, &taskCount);

     do {
          printf("\nTo-Do List Menu:\n");
        printf("1. View Tasks\n");
        printf("2. Add Task\n");
        printf("3. Delete Task\n");
        printf("4. Save & Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
           viewTasks(tasks, taskCount);
          break;
        case 2: 
          addTask(tasks, &taskCount);
          break;
        case 3:
           deleteTask(tasks, &taskCount);
           break;
         case 4: 
            saveTasksToFile(tasks, taskCount);
            printf("Exiting....\n");
            break;
        default:
             printf("Invalid Choice. Try again.\n");
          break;
        }
     } while(choice != 4);
     return 0;
}