import 'package:ambulance/screens/loging.dart';
import 'package:ambulance/widget/textField.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/rigester_provider.dart';
import '../utils/text.dart';

class RigesteerPage extends StatefulWidget {
  const RigesteerPage({super.key});

  @override
  State<RigesteerPage> createState() => _RigesteerPageState();
}

class _RigesteerPageState extends State<RigesteerPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 252, 252, 252),
              border: Border.all(width: 3, color: Colors.orange),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Consumer<RegisterProvider>(
                builder: (context, value1, child) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextFile.T_Account_Create,
                        style: GoogleFonts.urbanist(
                            color: Colors.orange,
                            letterSpacing: .7,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        TextFile.T_SingnUp,
                        style: GoogleFonts.urbanist(
                            color: Colors.orange,
                            letterSpacing: .7,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: 40),
                      textfielddynamic(
                          labeltext: TextFile.T_User,
                          icon: const Icon(Icons.person),
                          controller: username),
                      SizedBox(height: 10),
                      textfielddynamic(
                          labeltext: TextFile.T_email,
                          icon: const Icon(Icons.email),
                          controller: email),
                      SizedBox(height: 10),
                      Passworddynamic(
                          labeltext: TextFile.T_password,
                          icon: const Icon(Icons.lock),
                          controller: password),
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
                                  value1.LoginR(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                child: const Text(
                                  TextFile.SignUP_button,
                                  style: TextStyle(
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
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            TextFile.T_already,
                            style: GoogleFonts.aBeeZee(color: Colors.orange),
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
