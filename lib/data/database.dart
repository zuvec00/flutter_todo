import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ['Create a ToDo app', false],
    ];
  }

  void updateData(){
    _myBox.put('TODOlIST',toDoList);
  }

  //load data
  void loadData(){
    toDoList=_myBox.get('TODOLIST');
  }
}


  