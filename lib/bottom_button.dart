import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback? ontap;
  final String buttonname;

  const BottomButton({required this.ontap, required this.buttonname});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      height: kbottomcolor,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bottomColor),
        ),
        child: Text(
          buttonname,
          style: buttonStyle,
        ),
      ),
    );
  }
}