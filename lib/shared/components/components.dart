import 'package:flutter/material.dart';

Widget TextCustomFiled({
  required String? Function(String?)? validator,
  TextAlign textAlign = TextAlign.left,
  bool obscureText = false,
  Color cursorColor = Colors.white,
  TextStyle? style = const TextStyle(color: Colors.white, fontSize: 17.0),
  required TextInputType? keyboardType,
  required InputDecoration? decoration,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: TextFormField(
      obscureText: obscureText,
      validator: validator,
      textAlign: textAlign,
      cursorColor: cursorColor,
      style: style,
      keyboardType: keyboardType,
      controller: controller,
      decoration: decoration,
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
