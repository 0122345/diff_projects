import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues _currentRangeValues = const RangeValues(0.0, 0.8);

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
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )              ],
            ),
          ),

          //title & cool image
          Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Alarm',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Matemasie',
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/images/alarmclock.png', width: 150),
              const SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Color.fromARGB(255, 1, 13, 19)],
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
                          icon: const Icon(Icons.arrow_drop_down_rounded,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //It should have been ticket icon
                        const Icon(
                          Icons.bookmark_added_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        const Column(
                          children: [
                            Text(
                              "Time and Date",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            Text(
                              "30/8/2024",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                            child: Image.asset('assets/images/tick.png',
                                width: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ), //for range
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Alarm Sound',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      'data',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              RangeSlider(
                values: const RangeValues(0.0, 0.6),
                min: 0.0,
                max: 1.0,
                divisions: 10,
                inactiveColor: Colors.white,
                activeColor: const Color.fromARGB(255, 38, 231, 12),
                labels: RangeLabels(
                    '${(_currentRangeValues.start * 100).round()}%',
                    '${(_currentRangeValues.end * 100).round()}%'),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ],
          ),

          //for what could be bottom navigation
           Padding(
             padding: const EdgeInsets.only(top: 30, left: 20
             ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.person,
                 size: 30,
                 color: Colors.white,
                ),

                Container(
                  width: 52,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color.fromARGB(255, 136, 228, 16), Color.fromARGB(255, 2, 173, 73)],
                  ),
                  ),
                  child: const Icon(Icons.watch_later_outlined,
                   size: 20,
                  ),
                  ),

                const Icon(Icons.settings,
                 size: 30,
                 color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
