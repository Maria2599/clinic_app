import 'package:flutter/material.dart';

const TextFieldDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.white,),
border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0))
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0))
  ),
  focusedBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0))
  ),
);

String phoneConst="";

String num="";