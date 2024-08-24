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
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'morning',
                        style: TextStyle(
                          color: Color.fromARGB(255, 217, 228, 218),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 210, 217, 219),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 210, 217, 219),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.notifications,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //that was upper let's go for card
          Container(
            width: 340,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('24 Aug,Frid',
                        style: TextStyle(
                          color: Colors.green.shade50
                        ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Today progress',
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0
                         ),
                        ),
                      ),
                    ],
                  ),
                ),),


                const Expanded(child: Column(

                ),),
              ],
            ),
          ),



          //for ongoing section
          Container(),
          //for completed section
          Container(),
        ],
      ),
    );
  }
}
