import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
          const SizedBox(height: 20.0),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '24 Aug,Frid',
                            style: GoogleFonts.maShanZheng(
                              fontSize: 20.0,
                              color: const Color.fromARGB(255, 173, 179, 173),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Today progress',
                            style: GoogleFonts.baskervville(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '10/12 tasks',
                            style: TextStyle(
                              color: Color.fromARGB(255, 173, 179, 173),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '83%',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SimpleCircularProgressBar(
                                progressColors: [
                                  Colors.cyan,
                                  Colors.green,
                                  Colors.purpleAccent,
                                  Colors.amberAccent
                                ],
                                size: 25,
                                startAngle: -180,
                                progressStrokeWidth: 10,
                                backStrokeWidth: 10,
                                mergeMode: true,
                                animationDuration: 6,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //for ongoing section
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 16.0),
                      const Text(
                        'Ongoing',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0, left: 12.0,),
                      child: Container(
                        width: 36,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 210, 217, 219),
                        ),
                         child:  const Align(
                          alignment: Alignment.center,
                           child: Text("2",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                           ),
                         ),
                     
                      ),
                    )
                    ],
                  ),
                ),
              // ongoing builder
              ],
            ),
          ),

          //for completed section
          Container(),//completed 
        ],
      ),
    );
  }
}
