import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crazy_todoapp/data/random_image.dart';
import 'package:crazy_todoapp/utils/drawer.dart';
import 'package:crazy_todoapp/components/home.dart';

class HomePage extends GetView<MyDrawerController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeInOut,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final RandomImageDisplay _imageDisplay = RandomImageDisplay();
  final MyDrawerController controller = Get.find<MyDrawerController>();

  @override
  void initState() {
    super.initState();
    _imageDisplay.startRandomImageDisplay((newImage) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _imageDisplay.stopRandomImageDisplay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imageDisplay.currentImage.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Manage',
                        style: GoogleFonts.dmSerifDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'your',
                        style: GoogleFonts.dmSerifDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'tasks',
                          style: GoogleFonts.poppins(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 206, 198, 198),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Get started',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: FloatingActionButton(
                            mini: true,
                            shape: const CircleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(255, 133, 130, 130),
                                width: 3.0,
                              ),
                            ),
                            backgroundColor: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GeneralTaskPage(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child:  GetBuilder<MyDrawerController>(
              builder: (controller) => IconButton(
                onPressed: (){
                  controller.toggleDrawer();
                },
                 icon: Icon(
                  controller.isDrawerOpen ? Icons.close_rounded : Icons.sort,
                 ),
                  color:  const Color.fromARGB(255, 248, 3, 187),
                 iconSize: 30,
                 ),
              ),
          ),
        ],
      ),
    );
  }
}
