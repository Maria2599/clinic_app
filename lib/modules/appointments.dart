import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppointmentState();
}

class AppointmentState extends State<Appointments> {
  bool isSelected = false;
  bool isSelectedTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Appointments",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 20.0,
              ),
              child: const Text(
                "Days",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                height: 90.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Dates(
                        "Mon",
                        "21",
                      ),
                      Dates(
                        "Mon",
                        "21",
                      ),
                      Dates(
                        "Mon",
                        "21",
                      ),
                      Dates(
                        "Mon",
                        "21",
                      ),
                      Dates(
                        "Mon",
                        "21",
                      ),
                      Dates("Mon", "21"),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 20.0,
              ),
              child: const Text(
                "Morning",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 200.0,
              margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isSelectedTime=!isSelectedTime;
                    print(isSelectedTime);
                  });
                },
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    doctorTimings("8:30 AM"),
                    doctorTimings("8:30 AM"),
                    doctorTimings("8:30 AM"),
                    doctorTimings("8:30 AM"),
                    doctorTimings("8:30 AM"),
                    doctorTimings("8:30 AM"),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Dates(String day, String date) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });

          print(isSelected);
        },
        child: Container(
                width: 70.0,
                margin: EdgeInsets.only(right: 15.0),
                decoration: BoxDecoration(
                  color: isSelected? Color(0xff107163):Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: isSelected?  Colors.white:Colors.black,
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
                          color: isSelected?  Colors.white:Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )
            // : Container(
            //     width: 70.0,
            //     margin: EdgeInsets.only(right: 15.0),
            //     decoration: BoxDecoration(
            //       color: Color(0xffEEEEEE),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           child: Text(
            //             day,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(top: 10.0),
            //           padding: EdgeInsets.all(7.0),
            //           child: Text(
            //             date,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 15.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         )

                );
  }

  doctorTimings(String time) {
    return Container(
            margin: EdgeInsets.only( top: 10,right: 20.0),
            decoration: BoxDecoration(
                color: isSelectedTime? Color(0xff107163):Color(0xffEEEEEE) ,
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.access_time,
                    color: isSelectedTime? Colors.white: Colors.black,
                    size: 18.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2.0),
                  child: Text(
                    time,
                    style: TextStyle(color: isSelectedTime? Colors.white: Colors.black, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          );
        // : Container(
        //
        //     decoration: BoxDecoration(
        //         color: Color(0xffEEEEEE),
        //         borderRadius: BorderRadius.circular(5.0)),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //           margin: EdgeInsets.only(right: 2.0),
        //           child: Icon(
        //             Icons.access_time,
        //             color: Colors.black,
        //             size: 18.5,
        //           ),
        //         ),
        //         Container(
        //           margin: EdgeInsets.only(right: 2.0),
        //           child: Text(
        //             time,
        //             style: TextStyle(color: Colors.black, fontSize: 19.0),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
  }
}
