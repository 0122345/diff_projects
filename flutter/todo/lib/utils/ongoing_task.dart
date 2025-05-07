import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ongoing extends StatefulWidget {
  final Function(int) onTotalTasksChanged;

  const Ongoing({super.key, required this.onTotalTasksChanged});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  Task task = Task(name: 'Create wireframe', date: 'Today');
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: task.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  task.isChecked = value!;
                  widget.onTotalTasksChanged(task.isChecked ? 0 : 1);
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  task.date,
                  style: const TextStyle(
                    fontFamily: 'Matemasie',
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

class Task {
  final String name;
  final String date;
  bool isChecked;

  Task({required this.name, required this.date, this.isChecked = false});
}
class TaskRow extends StatefulWidget {
  final Task task;
  final VoidCallback onTaskStatusChanged;

  const TaskRow(
      {super.key, required this.task, required this.onTaskStatusChanged});

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.task.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.task.isChecked = value!;
              widget.onTaskStatusChanged();
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.name,
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.task.date,
              style: const TextStyle(
                fontFamily: 'Matemasie',
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
