import 'package:flutter/material.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {
   final IconData icon_child;
  final String ? child_string;
  IconContent({ required this.icon_child, this.child_string});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon_child,
        size: 80.0,),
        SizedBox(
          height:15.0
          ),
          Text(child_string!,
          style: klabelText,
          ),
      ],
    );
  }
}