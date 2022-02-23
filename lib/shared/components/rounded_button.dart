import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.color, required this.title, required this.onPressed});

  final Color? color;
  final String? title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(title!,
        style: TextStyle(color: Colors.white,fontSize: 19.0),),
      ),
    );
  }
}
