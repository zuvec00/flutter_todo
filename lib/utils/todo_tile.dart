import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/utils/NeuBox.dart';

class TodoTile extends StatelessWidget {
  final String task;
  final bool value;
  Function(BuildContext)? delete;
  Function(bool?)? onChanged;
  
  
  
  TodoTile({required this. task,required this.value,required this.onChanged,required this.delete});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion:const StretchMotion(),
          children:[
            SlidableAction(
              icon:Icons.delete_rounded,
              backgroundColor:Colors.redAccent,
              foregroundColor: Colors.grey[800],
              onPressed: delete,
              borderRadius:BorderRadius.circular(10))

          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            color:Colors.grey[700],
            borderRadius:BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
             children: [
               Checkbox(value: value, onChanged: onChanged),
               Text(task,style:TextStyle(decoration:value?TextDecoration.lineThrough:null)),
            ],),
          ),
        ),
      ),
    );
  }
}