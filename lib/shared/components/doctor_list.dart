import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSpecialistList() => Container(
      height: 100.0,
      width: 150.0,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Spacer(),
                  Text(
                    "\n  Click here",
                    textAlign: TextAlign.center,
                  ),
                ]),
          ),
        ]),
      ),
    );

Widget buildDoctorList() => Container(
      height: 200.0,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(30.0)),
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
                Text(
                  "Name ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 50.0,
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 150.0,),
                  child: Text(
                    "\n  Click here",
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
      ),
    );
