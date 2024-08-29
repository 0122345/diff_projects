import 'package:flutter/material.dart';

class DAilyRoutine extends StatefulWidget {
  const DAilyRoutine({super.key});

  @override
  State<DAilyRoutine> createState() => _DAilyRoutineState();
}

class _DAilyRoutineState extends State<DAilyRoutine> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Stack( 
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   color: Colors.black,
            // ),
            child: const Column(),
          ),
          Positioned(
             top: 180,
             left: 0,
             right: 0,
             bottom: 0,
            // height: MediaQuery.of(context).size.height/1/2,
            child:Container(
             decoration: const BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ), 
          )
          
        ],
       ),
    );
  }
}