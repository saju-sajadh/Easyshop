import 'dart:async';
import 'package:flutter/material.dart';
import 'package:EasyShop/screens/welcome_screen.dart';
import 'package:EasyShop/styles/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay =  Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement<void, void>(MaterialPageRoute(
      builder: (BuildContext context) {
        return WelcomeScreen();
      },
    ));
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.primaryColor,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'EasyShop',
            style: TextStyle(
              fontSize: 40, 
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
          SizedBox(height: 10), 
          Text(
            'shop easier and faster',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
}