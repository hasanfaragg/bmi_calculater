import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/shared/consts/const.dart';

class BMIResult extends StatelessWidget {
  final int age;
  final double result;
  final double weight;
  final double height;
  

  BMIResult({
    required this.age,
    required this.result,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          padding: EdgeInsets.all( 10,),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    bmiTextResult(result),
                    style: TextStyle(
                      color: bmiStatusColor(result),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: Center(
                  child: Text('Your BMI: ${result.toStringAsFixed(1)}', style: TextStyle(
                    fontSize: 30,
                    color: backgroundColor,
                  ),),
                ),
              ),
              Text('\nFor the information you entered: \n \n   Height: ${height.toStringAsFixed(0)} centimeters \n   Weight: $weight Kilograms \n   Age: $age \n \n ', style: TextStyle(
                fontSize: 20,
                color: backgroundColor,
              ),),
              Text(bmiArticleResult(result), style: TextStyle(
                fontSize: 20,
                color: backgroundColor,
              ),),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                color: Colors.cyan,
                  child: Text('Recalculate', style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String bmiTextResult(double result) {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result >= 18.5 && result < 25) {
      return 'Normal';
    } else if (result >= 25 && result < 29) {
      return 'Overweight';
    }
    return 'Obese';

  }

  String bmiArticleResult(double result) {
    if (result < 18.5) {
      return 'Your BMI is ${result.toStringAsFixed(1)}, indicating your weight is in the Underweight category for adults of your height. \n\nTalk with your healthcare provider to determine possible causes of underweight and if you need to gain weight.';
    } else if (result >= 18.5 && result < 25) {
      'Your BMI is ${result.toStringAsFixed(1)}, indicating your weight is in the Normal category for adults of your height. \n\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
    } else if (result >= 25 && result < 30) {
      return 'Your BMI is ${result.toStringAsFixed(1)}, indicating your weight is in the Overweight category for adults of your height. \n\nPeople who have overweight or obesity are at higher risk for chronic conditions such as high blood pressure, diabetes, and high cholesterol.';
    }
      return 'Your BMI is ${result.toStringAsFixed(1)}, indicating your weight is in the Obese category for adults of your height. \n\nPeople who are overweight or obese are at higher risk for chronic conditions such as high blood pressure, diabetes, and high cholesterol.';

  }

  MaterialColor bmiStatusColor(double result){
    if (result < 18.5) {
      return Colors.blue ;
    } else if (result >= 18.5 && result < 25) {
      return Colors.green;
    } else if (result >= 25 && result < 29) {
      return Colors.deepOrange;
    }
    return Colors.red;
    
  }
}
