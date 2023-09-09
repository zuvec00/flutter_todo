// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/NeuBox.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/progress.dart';
import 'package:todo_app/utils/todo_tile.dart';

import '../utils/floatingaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('myBox');

  //to do list
  var db = ToDoDatabase();

  //when the app is opened for the first time
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  int toDoListLength = 1;
  int taskCompleted = 0;

  var percentage = 0;

  void percent() {
    setState(() {
      double percentagedouble = ((taskCompleted / toDoListLength) * 100);
      percentage = percentagedouble.toInt();
    });
  }

  bool value = false;

  //controller
  final _controller = TextEditingController();

//checkbox was tapped
  onChanged(index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];

      if (db.toDoList[index][1] == true) {
        taskCompleted++;
      } else {
        taskCompleted--;
      }
      percent();
    });
    db.updateData();
  }

  //create new task
  void _createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(controller: _controller, save: _saveNewTask);
        });
  }

  //save new task

  void _saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      toDoListLength++;
      _controller.clear();
      percent();
    });
    Navigator.pop(context);
    db.updateData();
  }

  //delete Task
  delete(index) {
    setState(() {
      db.toDoList.removeAt(index);
      toDoListLength--;
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingButton(
          onPressed: _createNewTask,
        ),
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //icons
                  Icon(Icons.menu_rounded, color: Colors.orange, size: 30),
                  Icon(Icons.notifications_none_rounded,
                      color: Colors.orange, size: 30),
                ],
              ),
              const SizedBox(height: 25),

              // G R E E T I N G S
              Text('Hello Prince 🧑🏾',
                  style: TextStyle(fontSize: 30, color: Colors.grey[300])),
              const SizedBox(height: 25),

              // P R O G R E S S  D E T A I L S
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Task completed 🥅',
                  ),
                  Text('$taskCompleted/$toDoListLength'),
                ],
              ),
              SizedBox(height: 25),

              // P R O G R E S S  B A R
              NeuBox(
                height: 25,
                child: LinearPercentIndicator(
                  percent: taskCompleted / toDoListLength,
                  lineHeight: 20,
                  progressColor: Colors.orange,
                  backgroundColor: Colors.grey[800],
                  barRadius: Radius.circular(25),
                  animation: true,
                  animationDuration: 500,
                  center: Text('$percentage%'),
                ),
              ),

              const SizedBox(height: 25),

              //T O D O  H E A D E R
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('My Task', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),
                      Container(
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Text('$toDoListLength',
                                    style: TextStyle(fontSize: 10))),
                          )),
                    ],
                  ),
                  Text('see all', style: TextStyle(color: Colors.grey[500])),
                ],
              ),
              const SizedBox(height: 25),
              //T O D O  T I L E

              Expanded(
                child: ListView.builder(
                    itemCount: db.toDoList.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        task: db.toDoList[index][0],
                        value: db.toDoList[index][1],
                        onChanged: (context) => onChanged(index),
                        delete: (context) => delete(index),
                      );
                    }),
              )
            ]),
          ),
        ));
  }
}
