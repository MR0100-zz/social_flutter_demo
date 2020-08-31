import 'package:flutter/material.dart';
import 'package:social_design_demo/pages/homepage.dart';

void main() => runApp(SocialFlutterDemo());

class SocialFlutterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
