import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages.dart/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';


void main() async{
  //init the Hive
  await Hive.initFlutter();

  //open a box to store the data
  var box = await Hive.openBox('myBox');
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch:Colors.orange,textTheme: TextTheme(bodyText2:GoogleFonts.poppins(color:Colors.grey[300]))),
      home: HomePage(),
    );
  }
}
