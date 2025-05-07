import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DAilyRoutine extends StatefulWidget {
  const DAilyRoutine({super.key});

  @override
  State<DAilyRoutine> createState() => _DAilyRoutineState();
}

class _DAilyRoutineState extends State<DAilyRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   color: Colors.black,
            // ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 12.0),
                child: Column(
                  children: [
                    // App title with time but with dropdown
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            DateFormat('dd MMMM yyyy').format(DateTime.now()),
                            style: GoogleFonts.maShanZheng(
                                fontSize: 26.0,
                                color: const Color.fromARGB(255, 173, 179, 176),
                              ),
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 45.0,
                            color: Colors.white,
                          ),
                          onTap: () {
                            //for now let's go back after click Nah we have
                            //Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    //slide dates with white active one
                     Align(
                      alignment: Alignment.topCenter,
                       child: SizedBox(
                        height: 120,
                        child: CalendarSlider(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(const Duration(days: 14)),
                          lastDate: DateTime.now().add(const Duration(days: 18)),
                          onDateSelected: (date) {
                            if (kDebugMode) {
                              print('Selected date: date');
                            }
                          },
                        ),
                            ),
                     )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            // height: MediaQuery.of(context).size.height/1/2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            // child: Canvas(
            //   children: [
            //     CustomPaint(
            //       painter: CustomCalendarPainter(),
            //       size: Size(MediaQuery.of(context).size.width, 500),
            //     ),
            //    ],
            // ),
          ),
        ],
      ),
    );
  }
}
