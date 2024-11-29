import 'package:flutter/material.dart';
import 'package:project/views/screens/signchoose_screen/signchoose_screen.dart';
import 'package:project/views/screens/signup/signUpDoctorPageOne.dart';
import 'package:project/views/screens/signup/signUpPatientPageOne.dart';
import 'package:project/views/screens/signup/signUpPatientPageTwo.dart';
import 'package:project/views/screens/signup/signUpDoctorPageTwo.dart';
import 'package:project/views/screens/login/loginDoctor.dart';
import 'package:project/views/screens/login/loginPatient.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignChooseScreen(),
      routes: {
        SignChooseScreen.pageRoute: (ctx) => const SignChooseScreen(),
        SignUpPatient.pageRoute: (ctx) => const SignUpPatient(),
        SignPatient.pageRoute: (ctx) => const SignPatient(),
        SignUpDoctor.pageRoute: (ctx) => const SignUpDoctor(),
        SignDoctor.pageRoute: (ctx) => const SignDoctor(),
        Logindoctor.pageRoute: (ctx) => const Logindoctor(),
        Loginpatient.pageRoute: (ctx) => const Loginpatient(),
      },
    );
  }
}

