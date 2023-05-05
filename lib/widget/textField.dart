// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final _formKey = GlobalKey<FormState>();
// TextEditingController Cemail = TextEditingController();
// TextEditingController Cpassword = TextEditingController();









// class Passworddynamic extends StatefulWidget {
//   Passworddynamic(
//       {super.key,
//       required this.labeltext,
//       required this.icon,
//       required this.controller});

//   final String labeltext;
//   var controller;
//   var icon;

//   @override
//   State<Passworddynamic> createState() => _PassworddynamicState();
// }

// class _PassworddynamicState extends State<Passworddynamic> {
//   bool _obsecureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       // obscureText: true,
//       controller: widget.controller,
//       decoration: InputDecoration(
//           suffix: GestureDetector(
//             onTap: () {
//               setState(() {
//                 _obsecureText = !_obsecureText;
//               });
//               child:
//               Icon(_obsecureText ? Icons.visibility : Icons.visibility_off);
//             },
//             child:
//                 Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
//           ),
//           icon: widget.icon,
//           // border: OutlineInputBorder(

//           labelText: widget.labeltext),
//     );
//   }
// }
