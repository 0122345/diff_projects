import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_slider/calendar_slider.dart';
 

class Slider extends StatelessWidget {
  const Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarSlider(
       initialDate: DateTime.now(),
       firstDate: DateTime.now().subtract(const Duration(days: 4)),
       lastDate: DateTime.now().add(const Duration(days: 9)),
       onDateSelected: (date) {
         if (kDebugMode) {
           print('Selected date: date');
         }
       },
    );
  }
}
