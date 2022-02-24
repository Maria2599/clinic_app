import 'package:clinic_app/modules/cubit/login_cubit.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:clinic_app/modules/menu.dart';
import 'package:clinic_app/modules/phone.dart';
import 'package:clinic_app/shared/components/constants.dart';
import 'package:clinic_app/shared/components/rounded_button.dart';
import 'package:clinic_app/style/style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  ChangePassword() => setState(() => isHidden = !isHidden);

  @override
  Widget build(BuildContext context) {
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
  }
}
