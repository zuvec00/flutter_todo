// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  VoidCallback save;
  final controller;

  DialogBox({required this.controller,required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.orange,
         content: Container(
          height: 120,

          child:Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              TextField(
                controller : controller,
                decoration: InputDecoration(
                  hintText: 'Add a new task',
                  border:OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                MaterialButton(
                  color:Colors.orange[400],
                  child:Text('Save'),
                  onPressed:save),
                 const SizedBox(width:10),
                   MaterialButton(
                    color: Colors.orange[400],
                  child:Text('Cancel'),
                  onPressed:(){
                    Navigator.pop(context);
                  }),
              ],)
              
            ]
          )
         ));
  }
}
