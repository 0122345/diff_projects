import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondHomeScreenVi extends StatefulWidget {
  const SecondHomeScreenVi({super.key});

  @override
  State<SecondHomeScreenVi> createState() => _SecondHomeScreenViState();
}

class _SecondHomeScreenViState extends State<SecondHomeScreenVi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
           _buildHeader(context),
           _buildCalendar(),
        ],
      ));
  }
}

Widget _buildHeader(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'Focus Score',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          SizedBox(width: 20),

          Container(
            width: 28,
            height: 30,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Icon(Icons.person, size: 30),
          ),
        ],
      ),
    ],
  );
}

Widget _buildCalendar() {
  return Column(
    children: [
      Text("",
      // DateFormat('dd MMMM yyyy').format(DateTime.now()),
       style: GoogleFonts.maShanZheng(
                              fontSize: 26.0,
                              color: const Color.fromARGB(255, 173, 179, 176),
                            ),
      ),
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(),
        child: CalendarSlider(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 20)),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          onDateSelected: (date) {
            if (kDebugMode) {
              print('selected date: $date');
            }
          },
        ),
      ),
    ],
  );
}
