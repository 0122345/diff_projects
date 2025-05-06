import 'package:flutter/material.dart';

class GeneralBottomNav extends StatefulWidget {
  const GeneralBottomNav({super.key});

  @override
  State<GeneralBottomNav> createState() => _GeneralBottomNavState();
}

class _GeneralBottomNavState extends State<GeneralBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [],);
  }
}