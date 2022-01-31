import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/layout_screen/layout_screen.dart';
import 'package:simple_bmi_calculator/shared/consts/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
      theme: ThemeData(
        textTheme: TextTheme(),
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          trackHeight: 2,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 8,
          ),
        ),
      ),
    );
  }
}
