import 'package:flutter/material.dart';

class textfielddynamic extends StatelessWidget {
  textfielddynamic(
      {super.key,
      required this.labeltext,
      required this.icon,
      required this.controller});

  final String labeltext;
  var controller;
  var icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          icon: icon,
          // border: OutlineInputBorder(

          labelText: labeltext),
    );
  }
}

class Passworddynamic extends StatefulWidget {
  Passworddynamic(
      {super.key,
      required this.labeltext,
      required this.icon,
      required this.controller});

  final String labeltext;
  var controller;
  var icon;

  @override
  State<Passworddynamic> createState() => _PassworddynamicState();
}

class _PassworddynamicState extends State<Passworddynamic> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText: true,
      controller: widget.controller,
      decoration: InputDecoration(
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
              child:
              Icon(_obsecureText ? Icons.visibility : Icons.visibility_off);
            },
            child:
                Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
          ),
          icon: widget.icon,
          // border: OutlineInputBorder(

          labelText: widget.labeltext),
    );
  }
}
