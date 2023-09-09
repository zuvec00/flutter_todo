import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  VoidCallback onPressed;

  FloatingButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child:
        Icon(
          Icons.add,
          color:Colors.grey[800]
          ),
        onPressed: onPressed,);
  }
}