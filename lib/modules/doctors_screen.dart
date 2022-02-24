import 'package:clinic_app/shared/components/doctor_list.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>buildSpecialistList(), separatorBuilder: (context,index)=>SizedBox(width: 20.0,), itemCount: 10),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>buildDoctorList(), separatorBuilder: (context,index)=>SizedBox(height: 20.0,), itemCount: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

