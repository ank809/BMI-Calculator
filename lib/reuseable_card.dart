import'package:flutter/material.dart';
class Reuseable_container extends StatelessWidget {
  final Color ? colour;
  final  Widget ?cardChild;
    Reuseable_container({ this.colour,  this.cardChild});
   

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(6.0),
        ),
        );
    
  }
}