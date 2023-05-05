import 'package:ambulance/screens/rigester.dart';
import 'package:ambulance/screens/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/text.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  LoginR(context) async {
    // final CollectionReference users =
    //     FirebaseFirestore.instance.collection('users');
    // users.add({
    //   'email': email.text,
    //   'password': password.text,
    // });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServicesPage(),
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
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color.fromARGB(255, 124, 174, 240),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 252, 252, 252),
              border: Border.all(width: 6, color: Color.fromARGB(255, 102, 168, 255)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Consumer(
                builder: (context, value1, child) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextFile.T_Account_Create,
                        style: GoogleFonts.urbanist(
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: .7,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        TextFile.T_SingnUp,
                        style: GoogleFonts.urbanist(
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: .7,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: 40),
                      TextField(
                        // email text field------------------------------
                        controller: email,
                        obscureText: false,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 32, 32, 32))),
                        ),
                      
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => ServicesPage(),
                                  //     ));
                                  LoginR(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 124, 174, 240),
                                ),
                                child: const Text(
                                  TextFile.SignUP_button,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RigesteerPage()));
                          },
                          child: Text(
                            "Didn't have an account? SignUp",
                            style: GoogleFonts.aBeeZee(color: Color.fromARGB(255, 0, 0, 0)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
