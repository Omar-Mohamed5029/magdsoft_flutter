import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magdsoft_task/presentation/screens/auth/login.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LogIN_Screen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Image.asset(
            'assets/images/Capture.PNG',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}
