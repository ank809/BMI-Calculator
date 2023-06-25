import 'package:flutter/material.dart';
import 'input_page.dart';
const primaryColour=Color(0xFF0A0E21);
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
      primaryColor: primaryColour,
        scaffoldBackgroundColor: primaryColour,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColour),
      ),
      home:Home_page() ,

    );
}
}

