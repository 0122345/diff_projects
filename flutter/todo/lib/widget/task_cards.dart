import 'package:flutter/material.dart';

class TaskCards extends StatefulWidget {
  const TaskCards({super.key});

  @override
  State<TaskCards> createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          _buildHeader(),
        ],
      ),
    );
  }
}

/*
TODO: it should have 

header: task
time: date && timer
checkbox
wrapper:(description)
*/

Widget _buildHeader() {
  return  Row(
    children: [
      const Text("Header"),
      const SizedBox(width: 12,),
      Text('$DateTime.now()'),
    ],
  );
}
