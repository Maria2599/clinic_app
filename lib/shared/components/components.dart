import 'package:clinic_app/models/doctorModel.dart';
import 'package:clinic_app/style/style.dart';
import 'package:flutter/material.dart';

Widget TextCustomFiled({
  required String? Function(String?)? validator,
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
      cursorColor: cursorColor,
      style: style,
      keyboardType: keyboardType,
      controller: controller,
      decoration: decoration,
    ),
  );
}
Widget buildDoctorList(Doctor list) => Container(
  height: 200.0,
  decoration: BoxDecoration(
      color: background, borderRadius: BorderRadius.circular(15.0)),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dr: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0,top: 10.0),
            child: Text(
              "${list.firstName +"  "+ list.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),

          Text(
            "${list.specialization}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
          ),
        ]),
  ),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

