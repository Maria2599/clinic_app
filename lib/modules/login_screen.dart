import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic_app/modules/cubit/login_cubit.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:clinic_app/modules/menu.dart';
import 'package:clinic_app/modules/registration_screen.dart';
import 'package:clinic_app/shared/components/components.dart';
import 'package:clinic_app/shared/components/constants.dart';
import 'package:clinic_app/shared/components/rounded_button.dart';
<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
=======
import 'package:clinic_app/style/style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
>>>>>>> 697a097267278a5016dafbba319c9f1a4f022ec4
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginState();
}

var formkey = GlobalKey<FormState>();
var email = TextEditingController();
var password = TextEditingController();

class LoginState extends State<Login> {
  bool isHidden = false;
  Timer? _timer;
  late double _progress;

  ChangePassword() => setState(() => isHidden = !isHidden);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocConsumer<LoginCubit, States>(
        listener: (BuildContext context, state) {
      if (state is LoginLoadingState) {
        _progress = 0;
        _timer?.cancel();
        _timer =
            Timer.periodic(const Duration(milliseconds: 5), (Timer timer) {
          EasyLoading.showProgress(_progress,
              status:
                  '${(_progress * 100).toStringAsFixed(0)}% \n Loading');
          _progress += 0.03;

          if (_progress >= 1) {
            _timer?.cancel();
            EasyLoading.dismiss();
          }
        });
      } else if (state is LoginSuccessState) {
        EasyLoading.showSuccess("Successful",
            duration: Duration(seconds: 3));

       navigateTo(
            context,
             AnimatedSplashScreen(
                      splash: Image(
                        image: AssetImage("images/back.jpg"),
                        width: double.infinity,
                      ),
                      nextScreen: Menu(),
                      centered: false,
                      splashIconSize: double.infinity,
                    ));
      } else if (state is LoginErrorState) {
        EasyLoading.showError("Error", duration: Duration(seconds: 5));
      }
    }, builder: (BuildContext context, Object? state) {
      var cubit = LoginCubit.get(context);
      return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF4bcb66),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Form(
                            key: formkey,
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        'images/sssaaa.png',
                                      ),
                                      width: 250.0,
                                    ),
                                    const Text("CLINIC NAME",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 29.0,
                                            fontWeight: FontWeight.w900)),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "YOUR SLOGAN HERE",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 50.0,
                                    ),
                                    TextCustomFiled(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email can't be empty";
                                        } else if (!RegExp(
                                                "^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]")
                                            .hasMatch(value)) {
                                          return 'Enter a valid Email.. \n it must not include space or - or _ or / ';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType:
                                          TextInputType.emailAddress,
                                      controller: email,
                                      decoration:
                                          TextFieldDecoration.copyWith(
                                        filled: true,
                                        fillColor: Colors.green,
                                        labelText: "Email",
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    TextCustomFiled(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password can't be empty";
                                        } else if (value.length < 6) {
                                          return "Password must be more than 6 letters ";
                                        } else {
                                          return null;
                                        }
                                      },
                                      obscureText: isHidden,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: password,
                                      decoration:
                                          TextFieldDecoration.copyWith(
                                              filled: true,
                                              fillColor: Colors.green,
                                              labelText: "Password",
                                              prefixIcon: const Icon(
                                                Icons.password_rounded,
                                                color: Colors.white,
                                              ),
                                              suffixIcon: IconButton(
                                                  onPressed: ChangePassword,
                                                  icon: isHidden
                                                      ? const Icon(
                                                          Icons
                                                              .lock_outline,
                                                          color:
                                                              Colors.white,
                                                          size: 20.0,
                                                        )
                                                      : const Icon(
                                                          Icons.lock_open,
                                                          color:
                                                              Colors.white,
                                                          size: 22.0,
                                                        ))),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Forget Password?",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        )),
                                    const SizedBox(
                                      height: 35.0,
                                    ),
                                    RoundedButton(
                                      title: "LogIn",
                                      onPressed: () async {
                                        AnimatedSplashScreen(
                                          splash: Image.asset(
                                              "images/back.jpg"),
                                          nextScreen: Menu(),
                                          splashTransition: SplashTransition
                                              .rotationTransition,
                                          backgroundColor: Colors.white,
                                        );
                                        String s = "";
                                        if (formkey.currentState!
                                            .validate()) {
                                          print(email.text);
                                          cubit.logInUser(
                                              email: email.text,
                                              password: password.text);
                                        }
                                      },
                                      color: Color(0xFF148e41),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Don't have an account?",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Registration(),
                                                  ));
                                            },
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    )
                                  ],
=======
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, States>(
            listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
          }
        }, builder: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
              body: Column(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 200.0),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(children: const [
                                Text("Welcome Back!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5.0,),
                                Text(
                                  "Log in to your account",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
>>>>>>> 697a097267278a5016dafbba319c9f1a4f022ec4
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email can't be empty";
                                    } else if (!RegExp(
                                            "^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]")
                                        .hasMatch(value)) {
                                      return 'Enter a valid Email.. \n it must not include space or - or _ or / ';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  controller: email,
                                  decoration: TextFieldDecoration.copyWith(
                                    hintText: "Enter your Email",
                                    suffixIcon: const Icon(
                                      Icons.person_outline,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can't be empty";
                                    } else if (value.length < 6) {
                                      return "Password must be more than 6 letters ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: isHidden,
                                  textAlign: TextAlign.center,
                                  controller: password,
                                  decoration: TextFieldDecoration.copyWith(
                                      hintText: "Enter your Password",
                                      suffixIcon: IconButton(
                                          onPressed: ChangePassword,
                                          icon: isHidden
                                              ? const Icon(
                                                  Icons.lock_outline,
                                                  size: 20.0,
                                                )
                                              : const Icon(
                                                  Icons.lock_open,
                                                  size: 22.0,
                                                ))),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 35.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                              builder: (context) => RoundedButton(
                                title: "LogIn",
                                onPressed: () async {
                                  String s = "";
                                  if (formkey.currentState!.validate()) {
                                    print(email.text);
                                    cubit.logInUser(
                                        email: email.text,
                                        password: password.text);
                                  }
                                },
                                color: active,
                              ),
                            ),
<<<<<<< HEAD
                          )))
                ])),
      );
    });
=======
                            const SizedBox(
                              height: 80.0,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black54),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.blue),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    )))
          ]));
        }));
>>>>>>> 697a097267278a5016dafbba319c9f1a4f022ec4
  }
}
