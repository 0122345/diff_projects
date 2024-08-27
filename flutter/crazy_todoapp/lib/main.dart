import 'package:crazy_todoapp/components/homepage.dart';
import 'package:crazy_todoapp/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  Get.put<MyDrawerController>(MyDrawerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
      theme: ThemeData(
         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
 