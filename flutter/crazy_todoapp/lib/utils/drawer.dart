import 'package:crazy_todoapp/components/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  bool isDrawerOpen = false;

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();

    if (isDrawerOpen) {
      zoomDrawerController.close?.call();
    } else {
      zoomDrawerController.open?.call();
    }

    isDrawerOpen = !isDrawerOpen;
    update();
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 212, 218, 218),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Matemasie',
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.settings_suggest_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: 100,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 70),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Theme Settings',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.light_mode,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'About us',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.info,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Help',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.help_outline,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Logout',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.logout,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Privacy policy',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.lock,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Terms and Conditions',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.gavel,
                            size: 20,
                            color: Color.fromARGB(255, 0, 187, 201),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
