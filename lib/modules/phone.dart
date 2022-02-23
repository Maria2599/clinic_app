import 'package:clinic_app/models/userModel.dart';
import 'package:clinic_app/shared/components/constants.dart';
import 'package:clinic_app/shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit/login_cubit.dart';
import 'cubit/states.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = "tel:${num}";
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              await launch(url);
            },
            child: Text(num),
          ),
        ),
      ),
    );
  }
}
