import 'package:clinic_app/models/doctorModel.dart';
import 'package:clinic_app/shared/components/components.dart';
import 'package:clinic_app/shared/components/doctor_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/appCubit.dart';
import 'cubit/states.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = "brain suregry";

    return BlocConsumer<AppCubit, States>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text("Doctors")),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder<List<Doctor>>(
                        future: cubit.getDoctor(),
                        builder: (context, snapshot) {
                          //print(snapshot.data!.id);
                          var list = cubit.specialization;
                          print(list[0].specialization);

                          if (!snapshot.hasData) {
                            return Container(
                                width: double.infinity,
                                color: Colors.yellow,
                                child: Center(
                                  child: Text("loading"),
                                ));
                          }
                          if (snapshot.hasError) {
                            return Container(
                                width: double.infinity,
                                color: Colors.red,
                                child: const Center(
                                  child: Text('Error'),
                                ));
                          }

                          return Container(
                            color: Colors.yellow,
                            height: 100.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 130.0,
                                    color: Colors.red,
                                    child: ListTile(
                                      title: Text(
                                        "${list[index].specialization}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onTap: () {

                                        navigateTo(context, DoctorList());
                                        cubit.getSpecialization(
                                            value: list[index].specialization);
                                      },
                                    ),
                                  ),
                                );
                              }, // buildSpecialistList(special[index]),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 20.0,
                              ),
                              itemCount: list.length,
                            ),
                          );
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    FutureBuilder<List<Doctor>>(
                        future: cubit.getDoctor(),
                        builder: (context, snapshot) {
                          //print(snapshot.data!.id);
                          var list = snapshot.requireData;

                          if (!snapshot.hasData) {
                            return Container(
                                width: double.infinity,
                                color: Colors.yellow,
                                child: Center(
                                  child: Text("loading"),
                                ));
                          }
                          if (snapshot.hasError) {
                            return Container(
                                width: double.infinity,
                                color: Colors.red,
                                child: const Center(
                                  child: Text('Error'),
                                ));
                          }

                          return Container(
                              width: double.infinity,
                              child: Center(
                                child: ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        buildDoctorList(list[index]),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                    itemCount: list.length),
                              ));
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget buildSpecialistList(special) => Container(
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
                    "${special}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ]),
          ),
        ]),
      ),
    );
