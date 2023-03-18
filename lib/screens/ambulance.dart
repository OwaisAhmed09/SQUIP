import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulancePage extends StatelessWidget {
  const AmbulancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text("SERVIES",
            style: GoogleFonts.actor(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
           crossAxisAlignment: CrossAxisAlignment.center ,
        children: [
          Center(
            child: Text("An Ambulance is coming soon as soon as possible"),
          )
        ],
      ),
    ));
  }
}
