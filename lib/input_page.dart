import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'reuseable_card.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';
enum Gendertype {male, female}
const bottomColor=Color(0xFFEB1555);

class Home_page extends StatefulWidget {
  const Home_page({super.key,});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
    Gendertype ?selectedGender;
    int height=180;
    int weight=60;
    int age=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gendertype.male;
                        });
                      },
                      child: Reuseable_container(
                        colour: selectedGender == Gendertype.male
                            ? kactiveCardColor
                            : kinactiveCardColor,
                        cardChild: IconContent(
                          icon_child: FontAwesomeIcons.mars,
                          child_string: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gendertype.female;
                        });
                      },
                      child: Reuseable_container(
                        colour: selectedGender == Gendertype.female
                            ? kactiveCardColor
                            : kinactiveCardColor,
                        cardChild: IconContent(
                          icon_child: FontAwesomeIcons.venus,
                          child_string: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Reuseable_container(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: ktextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelText,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: bottomColor,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
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
                    child: Reuseable_container(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: klabelText,
                          ),
                          Text(
                            weight.toString(),
                            style: ktextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reuseable_container(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: klabelText,
                          ),
                          Text(
                            age.toString(),
                            style: ktextStyle,
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon: FontAwesomeIcons.plus, 
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                                SizedBox(width: 10.0,),
                                RoundIconButton(icon: FontAwesomeIcons.minus, 
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                })
                              ],),
                          ],
                        ),
                        ),
                      ),
                    ],
                  ),
                  ),
                   BottomButton(ontap: (){
                    Calculator_Brain cal= Calculator_Brain(height: height, weight: weight);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
                      bmiResults: cal.calculateBMI(),
                      resultText: cal.getResult(),
                      interpretation: cal.getInterpretation(),

                    )));
                   }, buttonname: 'CALCULATE')
                ]
                ),                  
          ),
        );
  }
}





