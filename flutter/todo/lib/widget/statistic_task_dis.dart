// todo: this is a wiget to hold list of items[tasks] and their states, async to account, but this should be listView builder


import 'package:flutter/material.dart';

class StaticTaskView extends StatefulWidget {
  const StaticTaskView({super.key});

  @override
  State<StaticTaskView> createState() => _StaticTaskViewState();
}

class _StaticTaskViewState extends State<StaticTaskView> {
  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}