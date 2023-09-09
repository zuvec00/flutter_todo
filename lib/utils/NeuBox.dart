import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  final double? height;

  NeuBox({required this.child,this.height,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:25.0),
      child: Container(
        width:MediaQuery.of(context).size.width-50,
        height: height,
        decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:Colors.grey[800],
        boxShadow:[
          BoxShadow(
            color:Colors.grey.shade700,
            offset: Offset(-4,-4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(4, 4),
            blurRadius: 5,
            spreadRadius: 1,
          ),

          ]
        ),
        child:child,
        
      ),
    );
  }
}