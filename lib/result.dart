import 'bottom_button.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';

class Result extends StatelessWidget {
  const Result({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(15.0),
              // alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: ktextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseable_container(
              colour: kactiveCardColor,
               cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Overweight',
                      style: kresultStyle,
                    ),
                    Text(
                      '56',
                      style: koutput,
                    ),
                    Text(
                      'Your results are not normal you should work on your diet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),      
            ),
             BottomButton(
                      ontap: () {
                        Navigator.of(context).pop();
                      },
                      buttonname: 'RE-CALCULATE',
                    ),
        ],
      ),
    );
  }
}