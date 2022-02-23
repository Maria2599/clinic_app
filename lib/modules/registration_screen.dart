import 'package:clinic_app/modules/cubit/register_cubit.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:clinic_app/modules/login_screen.dart';
import 'package:clinic_app/shared/components/rounded_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components/constants.dart';
import 'menu.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistrationState();
}

var formkey = GlobalKey<FormState>();
var email = TextEditingController();
var password = TextEditingController();
var phone = TextEditingController();
var name = TextEditingController();
var age = TextEditingController();

class RegistrationState extends State<Registration> {
  bool isHidden = false;

  ChangePassword() {
    setState(() => isHidden = !isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, States>(
            listener: (BuildContext context, state) {
              if(state is CreateUserSuccessState){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Menu()));

              }
            },
            builder: (BuildContext context, Object? state) {
              var cubit = RegisterCubit.get(context);
              return Scaffold(
                backgroundColor: Colors.white,
                body: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 155.0),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Create new account",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              TextFormField(
                                controller: name,
                                textAlign: TextAlign.center,
                                decoration: TextFieldDecoration.copyWith(
                                  hintText: "Enter your Name",
                                  suffixIcon: Icon(
                                    Icons.person,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              TextFormField(
                                controller: age,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: TextFieldDecoration.copyWith(
                                  hintText: "Enter your Age",
                                  suffixIcon: Icon(
                                    Icons.account_box_outlined,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
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
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: phone,
                                decoration: TextFieldDecoration.copyWith(
                                  hintText: "Enter your Phone",
                                  suffixIcon: Icon(
                                    Icons.phone_android_outlined,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email can't be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  controller: email,
                                  decoration: TextFieldDecoration.copyWith(
                                    hintText: "Enter your Email",
                                    suffixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 20.0,
                                    ),
                                  )),
                              const SizedBox(
                                height: 8.0,
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
                                            ? Icon(
                                                Icons.visibility_off,
                                                size: 20.0,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                size: 22.0,
                                              ))),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                                builder: (context) => RoundedButton(
                                  title: "SignUp",
                                  onPressed: () async {
                                    phoneConst = phone.text;
                                    String s = "";
                                    print(phoneConst);
                                    if (formkey.currentState!.validate()) {
                                      print(email.text);

                                      cubit.registerUser(
                                          email: email.text,
                                          password: password.text,
                                          phone: phone.text,
                                          name: name.text,
                                          age: age.text);
                                      // Navigator.push(
                                      //   //         context,
                                      //   //         MaterialPageRoute(
                                      //   //             builder: (context) => Menu()));

                                    }
                                  },
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Have an account?",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black54),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: Text(
                                        "LogIn",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.lightBlue),
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
              );
            }));
  }
}
