import 'package:flutter/material.dart';

class GeneralTaskPage extends StatefulWidget {
  const GeneralTaskPage({super.key});

  @override
  State<GeneralTaskPage> createState() => _GeneralTaskPageState();
}

class _GeneralTaskPageState extends State<GeneralTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              children: [
               Align(alignment:Alignment.topLeft, child:Text('Good')),
              Align(alignment:Alignment.bottomLeft, child:Text('Morning')),
              ]),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Icon(Icons.calendar_today,
               color: Color.fromARGB(255, 166, 175, 167),
              ),
            ),
            Container(
               width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 131, 185, 230),
              ),
              child: const Icon(Icons.notifications,
               color: Color.fromARGB(255, 166, 175, 167),
              ),
            ),
          ],
        ),
      ),
    );
  }
}