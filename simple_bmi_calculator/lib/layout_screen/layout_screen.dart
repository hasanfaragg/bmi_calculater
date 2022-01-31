import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:simple_bmi_calculator/results_screen/bmi_result.dart';
import 'package:simple_bmi_calculator/shared/consts/const.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    double weight = intWeight + decWeight / 10.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Body Mass Calculator',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 27, color: textColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                              color: !isMale ? textColor : Colors.white,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 30,
                                color: !isMale ? textColor : Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            isMale == true
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.cyan,
                                  )
                                : Container(),
                          ],
                        ),
                        elevation: 20,
                        color: !isMale ? backgroundColor : backgroundTaped,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                              color: isMale ? textColor : Colors.white,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 30,
                                color: isMale ? textColor : Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            isMale == false
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.cyan,
                                  )
                                : Container(),
                          ],
                        ),
                        elevation: 20,
                        color: isMale ? backgroundColor : backgroundTaped,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 50,
                            color: textColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220,
                      min: 60,
                      activeColor: Colors.cyan,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: backgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 15,
                              color: textColor,
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 30,
                            ),
                          ),
                          NumberPicker(
                            step: 1,
                            textStyle: TextStyle(
                              color: textColor,
                            ),
                            selectedTextStyle: TextStyle(
                              color: Colors.cyan,
                            ),
                            axis: Axis.vertical,
                            itemHeight: 25,
                            itemWidth: 70,
                            value: age,
                            minValue: 20,
                            maxValue: 120,
                            onChanged: (value) => setState(
                              () => age = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      color: backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 15,
                              color: textColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$weight',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Kg',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NumberPicker(
                                textStyle: TextStyle(
                                  color: textColor,
                                ),
                                selectedTextStyle: TextStyle(
                                  color: Colors.cyan,
                                ),
                                axis: Axis.vertical,
                                itemHeight: 25,
                                itemWidth: 58,
                                value: intWeight,
                                minValue: 1,
                                maxValue: 250,
                                onChanged: (value) => setState(
                                  () => intWeight = value,
                                ),
                              ),
                              NumberPicker(
                                textStyle: TextStyle(
                                  color: textColor,
                                ),
                                selectedTextStyle: TextStyle(
                                  color: Colors.cyan,
                                ),
                                axis: Axis.vertical,
                                itemHeight: 25,
                                itemWidth: 58,
                                value: decWeight,
                                minValue: 0,
                                maxValue: 9,
                                onChanged: (value) => setState(
                                  () => decWeight = value,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                  heroTag: 'miuns',
                  mini: true,
                  backgroundColor: Colors.cyan,
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                  heroTag: 'plus',
                  backgroundColor: Colors.cyan,
                  mini: true,
                  child: Icon(
                    Icons.add,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      intWeight--;
                    });
                  },
                  heroTag: 'minus2',
                  mini: true,
                  backgroundColor: Colors.cyan,
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      intWeight++;
                    });
                  },
                  heroTag: 'plus2',
                  backgroundColor: Colors.cyan,
                  mini: true,
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(40),
              ),
              width: 200,
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(
                        age: age,
                        result: result,
                        weight: weight,
                        height: height,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
