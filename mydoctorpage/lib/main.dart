import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/DoctorPageDoctorView.dart';
import 'package:mydoctorpage/views/screens/DoctorPagePatientView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoctorpage/views/screens/HomePage.dart';
import 'package:mydoctorpage/views/screens/doc_modify_profile.dart';
import 'package:mydoctorpage/views/screens/PatientScreen.dart';


import 'views/screens/signchoose_screen/signchoose_screen.dart';
import 'views/screens/signup/signUpDoctorPageOne.dart';
import 'views/screens/signup/signUpPatientPageOne.dart';
import 'views/screens/signup/signUpPatientPageTwo.dart';
import 'views/screens/signup/signUpDoctorPageTwo.dart';
import 'views/screens/login/loginDoctor.dart';
import 'views/screens/login/loginPatient.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      home: const SignChooseScreen(),


      routes: {
        SignChooseScreen.pageRoute: (ctx) => const SignChooseScreen(),
        SignUpPatient.pageRoute: (ctx) => const SignUpPatient(),
        SignPatient.pageRoute: (ctx) => const SignPatient(),
        SignUpDoctor.pageRoute: (ctx) => const SignUpDoctor(),
        SignDoctor.pageRoute: (ctx) => const SignDoctor(),
        Logindoctor.pageRoute: (ctx) => const Logindoctor(),
        Loginpatient.pageRoute: (ctx) => const Loginpatient(),
      
        '/home': (context) => HomePage(),
        '/DoctorPagePatientView': (context) => Doctor(),
        '/rdv': (context) => DoctorDoctor(),
        '/doc_profile': (context) => DocModifyProfile(),
        '/patient_screen': (context) => PatientScreen(),
        
      },
    );
  }
}
