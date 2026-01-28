import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'daycalculator.dart';
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 1. Enter the size of your Figma Artboard here
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // 2. Use the 'builder' to return your MaterialApp
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const DayCalc(),
        );
      },
    );
  }
}