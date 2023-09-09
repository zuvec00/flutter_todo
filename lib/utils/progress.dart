import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/utils/NeuBox.dart';

class Progress extends StatefulWidget {
  final int taskCompleted;
  final int totalTasks;

  Progress ({required this.taskCompleted,required this.totalTasks});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double percentage = 0;

  void percent(){
    setState((){
      percentage= widget.taskCompleted/widget.totalTasks;
    });
     
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
      ],
    );
  }
}
