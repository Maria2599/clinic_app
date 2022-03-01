
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic_app/modules/appointments.dart';
import 'package:clinic_app/modules/cubit/register_cubit.dart';
import 'package:clinic_app/modules/doctors_screen.dart';
import 'package:clinic_app/modules/login_screen.dart';
import 'package:clinic_app/modules/menu.dart';
import 'package:clinic_app/modules/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'modules/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: "AIzaSyANas1OuTxbswXiFPbMURkVwXl3dHoYVZA",
  //         appId: "1:170001888125:web:39f5520e8f688cc5419214",
  //         messagingSenderId: "170001888125",
  //         projectId: "clinic-app-65bdd"));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => RegisterCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         home:Login(),

        builder: EasyLoading.init(),
      ),
    );
  }
}
