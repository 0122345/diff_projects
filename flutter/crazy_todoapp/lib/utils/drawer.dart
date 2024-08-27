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
  Widget build(context) {
    return Container(
      color: Colors.amber,
    );
  }
}
