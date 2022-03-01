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
<<<<<<< HEAD
      borderRadius: BorderRadius.circular(10.0),
=======
      borderRadius: BorderRadius.circular(30.0),
>>>>>>> 697a097267278a5016dafbba319c9f1a4f022ec4
      elevation: 6.0,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(title!,
        style: TextStyle(color: Colors.white,fontSize: 19.0),),
      ),
    );
  }
}
