import 'package:clinic_app/models/doctorModel.dart';
import 'package:clinic_app/modules/cubit/appCubit.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, States>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, Object? state) {

    var cubit = AppCubit.get(context);
    return Scaffold(
    appBar: AppBar(
    title: Center(child: Text("Doctors")),
    ),
    backgroundColor: Colors.white,
    body:  FutureBuilder<List<Doctor>>(
        future: cubit.getDoctor(),
        builder: (context, snapshot) {
          //print(snapshot.data!.id);
          var list = cubit.spec;

          if (!snapshot.hasData) {
            return Container(
                width: double.infinity,
                color: Colors.yellow,
                child: Center(
                  child: Text("loading"),
                )
            );
          }
          if (snapshot.hasError) {
            return Container(
                width: double.infinity,
                color: Colors.red,
                child: const Center(
                  child: Text('Error'),
                )
            );
          }

          return Container(
              width: double.infinity,
              child:  Center(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildDoctorList(list[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ),
                    itemCount: list.length),
              ));
        }),
    );
    });

  }
}

