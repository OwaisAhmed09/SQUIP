
import 'package:ambulance/screens/loging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum UserType {
  user,
  ambulance,
  police,
  firebrigade,
}

class RegisterProvider with ChangeNotifier {
  TextEditingController usernme = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  //  void adduser(){

  UserType _userType = UserType.user;

  UserType get userType => _userType;

  setUserType(UserType type) {
    _userType = type;
    notifyListeners();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  LoginR(context) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    users.add({
      'username': usernme.text,
      'email': email.text,
      'password': password.text,
      'usertype': _userType.name,
    });
    try {
      final Credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      email.clear();
      password.clear();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    } on FirebaseAuthException catch (e) {
      print(
        e.toString(),
      );
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.grey,
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color: Color.fromARGB(255, 8, 8, 8)),
              ),
            );
          });
    }

    notifyListeners();
  }
}


