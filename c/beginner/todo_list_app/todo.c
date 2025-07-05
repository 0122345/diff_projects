//TODO: defining Functions

#include<stdio.h>
#include<string.h>
#include "todo.h"


void addTask(char tasks[][MAX_LENGTH], int *taskCount) {
    if (*taskCount >= MAX_TASKS) {
        printf("Task list is full!\n");
        return;
    }
    printf("Enter task: ");
    getchar(); // Clear newline
    fgets(tasks[*taskCount], MAX_LENGTH, stdin);
    tasks[*taskCount][strcspn(tasks[*taskCount], "\n")] = '\0'; // Remove newline
    (*taskCount)++;

     printf("Task added.\n");
}


void viewTasks(char tasks[][MAX_LENGTH], int taskCount) {
     if(taskCount == 0){
          printf("No tasks found.\n");
          return;
     }

     printf("Your Tasks: \n");
     for(int i =0; i < taskCount; i++){
          printf("%d. %s\n", i + 1, tasks[i]);
     }
}

void deleteTasks(char tasks[][MAX_LENGTH], int *taskCount){
     int index;
     printf("Enter task number to delete: ");
     scanf("%d", &index);
     if(index < 1 || index > *taskCount){
          printf("Invalid task number.\n");
          return;
     }
     for(int i = index - 1; i < *taskCount -1; i++){
          strcpy(tasks[i], tasks[i + 1]);
     }
     (*taskCount)--;
     printf("Task Deleted Sucessfully...\n");
}


void saveTasksToFile(char tasks[][MAX_LENGTH], int taskCount){
     FILE *file = fopen("tasks.txt", "w");
     for(int i = 0; i < taskCount; i++){
          fprintf(file, "%s\n", tasks[i]);
     }
     fclose(file);
     printf("Task saved to file successful\n");
}

void loadTasksToFile(char tasks[][MAX_LENGTH], int *taskCount) {
     FILE *file = fopen("tasks.txt", "r");
     if(!file) return;

     while(fgets(tasks[*taskCount], MAX_LENGTH, file)){
          tasks[*taskCount][strcspn(tasks[*taskCount], "\n")] = '\0';
          (*taskCount)++;
     }
     fclose(file);
}