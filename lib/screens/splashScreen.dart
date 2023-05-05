import 'dart:async';

import 'package:ambulance/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogInPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 124, 174, 240),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(80)),
            Container(
              height: 200,
              width: 200,
              child: const Image(
                image: AssetImage("assets/images/images.png"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                "SQUIP",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
            ),
            Text(
              'Safe & Quick Pakistan',
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
