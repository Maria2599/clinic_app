import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LocalizationSystemPage extends StatefulWidget {
  const LocalizationSystemPage({Key? key}) : super(key: key);

  @override
  State<LocalizationSystemPage> createState() => _LocalizationSystemPageState();
}

class _LocalizationSystemPageState extends State<LocalizationSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column
          (children: [

            Text(
              AppLocalizations.of(context)!.language,

              style: TextStyle(fontSize: 30),
            ),
        ],),
      ),
    );
  }
}
