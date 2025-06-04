//TODO: Respesentng a single task
 public class TaskItem
{
    public string Description { get; set; }   
    public TaskItem(string description)
    {
        Description = description;  
    }

    public override string ToString()
    {
        return Description;
    }
}
