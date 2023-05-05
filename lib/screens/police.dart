import 'package:ambulance/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class PolicePage extends StatelessWidget {
  const PolicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: SolidColors.fontColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: SolidColors.appbar,
        title: Text("SERVIES",
            style: GoogleFonts.actor(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("The Police is coming soon as soon as possible"),
          ],
        ),
      ),
    ));
  }
}
