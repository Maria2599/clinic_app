import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic_app/modules/cubit/register_cubit.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:clinic_app/shared/components/components.dart';
import 'package:clinic_app/shared/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../shared/components/constants.dart';
import 'menu.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistrationState();
}

var formKey = GlobalKey<FormState>();
var email = TextEditingController();
var password = TextEditingController();
var phone = TextEditingController();
var name = TextEditingController();
var age = TextEditingController();

class RegistrationState extends State<Registration> {
  bool isHidden = false;
  Timer? _timer;
  late double _progress;

  changePassword() {
    setState(() => isHidden = !isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, States>(
        listener: (BuildContext context, state) {
      if (state is RegisterLoadingState) {
        _progress = 0;
        _timer?.cancel();
        _timer =
            Timer.periodic(const Duration(milliseconds: 20), (Timer timer) {
          EasyLoading.showProgress(_progress,
              status:
                  '${(_progress * 100).toStringAsFixed(0)}% \n Loading');
          _progress += 0.03;

          if (_progress >= 1) {
            _timer?.cancel();
            EasyLoading.dismiss();
          }
        });
      } else if (state is CreateUserSuccessState) {
        EasyLoading.showSuccess("Successful");

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
      } else if (state is RegisterErrorState) {
        EasyLoading.showError("Error", duration: Duration(seconds: 5));
      }
    }, builder: (BuildContext context, Object? state) {
      var cubit = RegisterCubit.get(context);

      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF4bcb66),
          body: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "LET'S START",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "CREATE AN ACCOUNT",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 30.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 14.0,
                        ),
                        TextCustomFiled(
                          obscureText: false,
                          controller: name,
                          textAlign: TextAlign.left,
                          decoration: TextFieldDecoration.copyWith(
                            filled: true,
                            fillColor: Colors.green,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            labelText: "Name",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name can't be empty";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        TextCustomFiled(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Age can't be empty";
                            } else {
                              return null;
                            }
                          },
                          obscureText: false,
                          controller: age,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                          decoration: TextFieldDecoration.copyWith(
                            filled: true,
                            fillColor: Colors.green,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            labelText: "Age",
                            prefixIcon: const Icon(
                              Icons.account_box_outlined,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextCustomFiled(
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone can't be empty";
                            } else if (!RegExp(r'(^(01)+[0-9]{9}$)')
                                .hasMatch(value)) {
                              return ('Enter a valid Phone Number');
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                          controller: phone,
                          decoration: TextFieldDecoration.copyWith(
                            filled: true,
                            fillColor: Colors.green,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            labelText: "Phone",
                            prefixIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextCustomFiled(
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.left,
                            controller: email,
                            decoration: TextFieldDecoration.copyWith(
                              filled: true,
                              fillColor: Colors.green,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10),
                              labelText: "Email",
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            )),
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
                          textAlign: TextAlign.left,
                          controller: password,
                          decoration: TextFieldDecoration.copyWith(
                              filled: true,
                              fillColor: Colors.green,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10),
                              labelText: "Password",
                              prefixIcon: const Icon(
                                Icons.password_rounded,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: changePassword,
                                  icon: isHidden
                                      ? const Icon(
                                          Icons.lock_outline,
                                          color: Colors.white,
                                          size: 20.0,
                                        )
                                      : const Icon(
                                          Icons.lock_open,
                                          color: Colors.white,
                                          size: 22.0,
                                        ))),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        RoundedButton(
                          title: "SignUp",
                          onPressed: () async {
                            phoneConst = phone.text;
                            String s = "";
                            print(phoneConst);
                            if (formKey.currentState!.validate()) {
                              print(email.text);
                              cubit.registerUser(
                                  email: email.text,
                                  password: password.text,
                                  phone: phone.text,
                                  name: name.text,
                                  age: age.text);
                            }
                          },
                          color: Color(0xFF148e41),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
