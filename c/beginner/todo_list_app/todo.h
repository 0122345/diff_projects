// TODO: Defining Constant and Data Structure

#ifndef TODO_H
#define TODO_H

#define MAX_TASKS 100
#define MAX_LENGTH 100

void addTask(char tasks[][MAX_LENGTH], int *taskCount);
void viewTasks(char tasks[][MAX_LENGTH], int taskCount);
void deleteTask(char tasks[][MAX_LENGTH], int *taskCount);
void saveTasksToFile(char tasks[][MAX_LENGTH], int taskCount);
void loadTasksFromFile(char tasks[][MAX_LENGTH], int *taskCount);

#endif