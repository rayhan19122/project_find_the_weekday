import 'package:flutter/material.dart';
import 'home.dart';
import 'daycalculator.dart';
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Stateful Widgets',
      debugShowCheckedModeBanner: false,
      home: DayCalc(),
    );
  }
}