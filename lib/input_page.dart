import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'reuseable_code.dart';
enum Gendertype {male, female}

class Home_page extends StatefulWidget {
  const Home_page({super.key,});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
    Gendertype ?selectedGender;
    int height=180;
    int weight=60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: 
            Row(
              children: [
                Expanded(child: 
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender=Gendertype.male;
                    });
                  },
                  child: Reuseable_container(
                    colour: selectedGender==Gendertype.male? kactiveCardColor:kinactiveCardColor,
                    cardChild: IconContent(
                      icon_child:FontAwesomeIcons.mars,
                      child_string: 'MALE',
                    ),
                  ),
                ),
                ),
                Expanded(child: 
                GestureDetector(
                  onTap: (){
                    setState(() {
                       selectedGender=Gendertype.female;
                    }); 
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender=Gendertype.female;
                      });
                    },
                    child: Reuseable_container(
                      colour: selectedGender==Gendertype.female? kactiveCardColor:kinactiveCardColor,
                      cardChild: IconContent(
                        icon_child: FontAwesomeIcons.venus ,
                        child_string: 'FEMALE',
                      ),
                    ),
                  ),
                ),
                ),
              ],
            ),
            ),
            Expanded(child: 
            Reuseable_container(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                  style: klabelText,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), 
                      style:ktextStyle,),
                      Text('cm',
                      style: klabelText,)
                    ],
                  ),
                  Slider(value: height.toDouble(),
                  min: 120.0,
                  max: 220.0, 
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                      height=newValue.toInt();
                    });
                  }),
                ],
                ),
                  ),
            ),
            Expanded(child: 
            Row(
              children: [
                Expanded(child: 
                Reuseable_container(
                  colour:kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                      style: ktextStyle,),
                      Text(weight.toString(),
                      style: ktextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                          icon : FontAwesomeIcons.plus, 
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      ),
                    ]),
                  ),
                ),
                Expanded(child: 
                Reuseable_container(
                  colour: kactiveCardColor,
                  ),
                ),
              ],
            ),
            ),
             Container(
                width: double.infinity,
                color: kbottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                height: kbottomcolor,
              ),
          ]
            ),
      )
          );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,   required this.onPressed});
final IconData icon;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed(),
    child: Icon(icon),
    elevation: 6.0,
    shape: CircleBorder(),
    constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
      
    ),
    fillColor: Color(0xFF4C4F5E),
    ) ;
  }
}

