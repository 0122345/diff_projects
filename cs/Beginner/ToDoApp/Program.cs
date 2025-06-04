using System;

class Program
{
     static void Main(string[] args)
     {
          ToDoList toDoList = new ToDoList();
          bool exit = false;

          while (!exit)
          {
               Console.Clear();
               Console.WriteLine("===== To-Do List =====");
               Console.WriteLine("1. View Tasks");
               Console.WriteLine("2. Add Task");
               Console.WriteLine("3. Delete Task");
               Console.WriteLine("4. Exit");
               Console.Write("Choose an option: ");

               string choice = Console.ReadLine();

               switch (choice)
               {
                    case "1":
                         Console.WriteLine("\nTasks: ");
                         toDoList.ShowTasks();
                         Pause();
                         break;

                    case "2":
                         Console.Write("\nEnter Task Description: ");
                         string desc = Console.ReadLine();
                         toDoList.AddTask(desc);
                         Console.WriteLine("Task Added!");
                         Pause();
                         break;

                    case "3":
                         Console.Write("\nEnter task number to delete: ");
                         if (int.TryParse(Console.ReadLine(), out int index))
                         {
                              toDoList.DeleteTask(index - 1);
                         }
                         else
                         {
                              Console.WriteLine("Invalide Input");
                         }
                         Pause();
                         break;

                    case "4":
                         exit = true;
                         break;

                    default:
                         Console.WriteLine("Invalid Option. ");
                         Pause();
                         break;
               }
          }
     }

     static void Pause()
     {
          Console.WriteLine("\nPress Enter to continue....");
          Console.ReadLine();
     }
}