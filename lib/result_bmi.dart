

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget{
  final String bmi;
  const ResultPage({super.key, required this.bmi,});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: const Text(
          "BMI CALCULATOR",
          style: kBodyTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(bmi, style: kResultTextStyle,),
        SizedBox(height: 180,),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            color: kBottomContainerColour,
            child: Center(child: Text("CALCULATE MY BMI", style: kLargeButtonTextStyle,),),
          ),
        ),
      ],),
    );
  }
}