import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  final String title;

  const ScreenLayout({required this.title, super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
        _buildTop(context, 'Go on'),
      ],
    );
  }
}

Widget _buildTop(BuildContext context, String hi) {
  return Container(
    height: 100,
    color: Colors.blue,
    decoration: BoxDecoration(),
    child: Column(
      children: [
         Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
          child:  Icon(Icons.arrow_back_ios_sharp, size: 30,),
         ),
        
        Text('$Text', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),

      ],
    ),
  );
}
