import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              child: Text("Month",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),),
            ),
            Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            height: 90.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Dates("Mon","21",true),
                Dates("Tue","22",false),
                Dates("Wed","23",false),
                Dates("Thr","24",false),
                Dates("Fri","25",false),
              ],
            ),
          ),
    ]  ),
      ),
    );
  }
  Dates(String day, String date, bool isSelected){
    return isSelected? Container(
    width: 70.0,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(7.0),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    ):Container(
      width: 70.0,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(7.0),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
