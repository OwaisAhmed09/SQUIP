import 'package:ambulance/screens/ambulance.dart';
import 'package:ambulance/screens/logInPage.dart';
import 'package:ambulance/screens/rigester.dart';
import 'package:ambulance/screens/services.dart';
import 'package:ambulance/screens/splashScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQUIP',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
      ),
      home: AmbulancePage(),
    );
  }
}
