import 'package:first_app_flutter/result_bmi.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.female;
  var age = 20;
  var height = 150;
  var weight = 0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "MALE",
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "FEMALE",
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kBodyTextStyle,),
                  Text(height.toString(), style: kNumberTextStyle,),
                  Slider(
                    min: 0, max: 220.0,

                    activeColor: kBottomContainerColour, value: height.toDouble(), onChanged: (value){
                    setState(() {
                      height = value.round();
                    });
                  })
                  ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Text("WEIGHT", style: kBodyTextStyle,),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(onPressed: (){setState(() {
                                weight++;
                              });}, child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),fillColor: kActiveCardColour,
                                padding: EdgeInsets.all(15),elevation: 10,),
                              MaterialButton(onPressed: (){setState(() {
                                weight--;
                              });}, child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),color: kActiveCardColour,
                                padding: EdgeInsets.all(15),elevation: 10,),
                            ],
                          )
                        ],
                      ),
                    )),
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kBodyTextStyle,),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(onPressed: (){setState(() {
                                age++;
                              });}, child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),fillColor: kActiveCardColour,
                                padding: EdgeInsets.all(15),elevation: 10,),
                              MaterialButton(onPressed: (){setState(() {
                                age--;
                              });}, child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),color: kActiveCardColour,
                                padding: EdgeInsets.all(15),elevation: 10,),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              final heightSqr = height/100;
              final res  = weight/(heightSqr *heightSqr);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage( bmi: res.toString(),)));
            },
            child: Container(
              height: 40,
              color: kBottomContainerColour,
              child: Center(child: Text("CALCULATE MY BMI", style: kLargeButtonTextStyle,),),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Gender { male, female }

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final VoidCallback? onTap;

  const ReusableCard({
    super.key,
    this.color = kInactiveCardColour,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: child,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
