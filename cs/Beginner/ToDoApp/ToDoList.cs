using System;
using System.Collections.Generic;
using System.IO;


public class ToDoList
{
     private List<TaskItem> tasks = new List<TaskItem>();
     private string filePath = "data.txt";

     public ToDoList()
     {
          LoadTasks();
     }

     public void AddTask(string description)
     {
          tasks.Add(new TaskItem(description));
          SaveTasks();
     }

     public void DeleteTask(int index)
     {
          if (index >= 0 && index < tasks.Count)
          {
               tasks.RemoveAt(index);
               SaveTasks();
          }
          else
          {
               Console.WriteLine("Invalid Task number");
          }
     }

     public void ShowTasks()
     {
          if (tasks.Count == 0)
          {
               Console.WriteLine("No tasks found.");
               return;
          }

          for (int i = 0; i < tasks.Count; i++)
          {
               Console.WriteLine($"{i + 1}. {tasks[i]}");
          }
     }

     private void SaveTasks()
     {
          File.WriteAllLines(filePath, tasks.ConvertAll(t => t.Description));
     }

     private void LoadTasks()
     {
          if (File.Exists(filePath))
          {
               var lines = File.ReadAllLines(filePath);
               foreach (var line in lines)
               {
                    tasks.Add(new TaskItem(line));
               }
          }
     }
}