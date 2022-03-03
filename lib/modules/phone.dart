import 'package:clinic_app/models/doctorModel.dart';
import 'package:clinic_app/modules/cubit/appCubit.dart';
import 'package:clinic_app/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/states.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = "tel:${num}";

    return BlocConsumer<AppCubit,States>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: Container(
              // child: Center(
              //   child: TextButton(
              //     onPressed: () async {
              //       await launch(url);
              //     },
              //     child: Text(num),
              //   ),
              // ),
              child: FutureBuilder<List<Doctor>>(
                  future: cubit.getDoctor(),
                  builder: (context, snapshot) {
                    //print(snapshot.data!.id);
                    var list = snapshot.requireData;

                    if (!snapshot.hasData) {
                      return Container(
                          width: 800,
                          height: 200,
                          color: Colors.yellow,
                          child: Center(
                            child: Text("${list[0].firstName}"),
                          )
                      );
                    }
                    if (snapshot.hasError) {
                      return Container(
                          width: 800,
                          height: 200,
                          color: Colors.red,
                          child: const Center(
                            child: Text('Error'),
                          )
                      );
                    }

                    return Container(
                        width: 800,
                        height: 200,
                        color: Colors.red,
                        child:  Center(
                        child: Text('${list[1].firstName}'),
                    ));
                  }),
            ));
      });
  }
}
