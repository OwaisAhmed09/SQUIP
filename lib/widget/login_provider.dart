import 'dart:js';
import 'dart:math';
import 'package:ambulance/screens/ambulance.dart';
import 'package:ambulance/screens/firbegade.dart';
import 'package:ambulance/screens/police.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class UserLoginProvider extends ChangeNotifier {
  route(
    context,
  ) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (!documentSnapshot.exists) {
        if (documentSnapshot.get('usertype') == "firebrigade") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FirbeadePage(),
            ),
          );
        } else if (documentSnapshot.get('usertype') == "police") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PolicePage(),
            ),
          );
        } else if (documentSnapshot.get('usertype') == "ambulance") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AmbulancePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ServicesPage(),
            ),
          );
        }
      } else {
        ScaffoldMessengerState().showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    });
    notifyListeners();
  }

  @override
  login(Context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pushReplacement(
          Context, MaterialPageRoute(builder: (context) => ServicesPage()));

      email.clear();
      password.clear();
    } on FirebaseAuthException catch (e) {
      print(
        e.toString(),
      );
      return showDialog(
          context: Context,
          builder: (Context) {
            return AlertDialog(
              backgroundColor: Colors.grey,
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color: Colors.black),
              ),
            );
          });
    }
    notifyListeners();
  }
}
