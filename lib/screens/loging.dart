import 'dart:math';

import 'package:ambulance/screens/rigester.dart';
import 'package:ambulance/widget/login_provider.dart';
import 'package:ambulance/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Consumer<UserLoginProvider>(
                  builder: (context, value, child) => Padding(
                    padding: EdgeInsets.only(),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 252, 252),
                          border: Border.all(width: 3, color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                TextFile.login_main,
                                style: GoogleFonts.urbanist(
                                    color: Colors.orange,
                                    letterSpacing: .7,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              textfielddynamic(
                                labeltext: TextFile.T_email,
                                icon: const Icon(Icons.email),
                                controller: email,
                              ),
                              const SizedBox(height: 10),
                              Passworddynamic(
                                  labeltext: TextFile.T_password,
                                  icon: const Icon(Icons.lock),
                                  controller: password),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      TextFile.T_forget,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.orange,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.login(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange,
                                    ),
                                    child: Text("Login")),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RigesteerPage(),
                                      ));
                                },
                                child: Text(
                                  TextFile.T_Account_Create,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.orange,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
