import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 7, 58),
      body: Column(
        children: [
          //it should be in AppBar but let's not
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    // MaterialPageRoute(builder:
                    //  (context) =>),
                    // );
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_rounded,
                        //size: ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //title & cool image
          Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Alarm',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Matemasie',
                  fontSize: 30,
                  ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/alarmclock.png', width: 150),
              const SizedBox(height: 20),
            ],
          ),
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  elevation: 5,
  child: Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.blue, Colors.blueGrey],
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      children: [
        Row(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Text(
                'Meeting Alert',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down_rounded, color: Colors.white),
            )
          ],
        ),
        const Row(

        ),
      ],
    ),
  ),
),          //for range
          const Column(
              //RangeSlider(values: values, onChanged: onChanged)
              ),

          //for what could be bottom navigation
        ],
      ),
    );
  }
}
