import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/DoctorPageDoctorView.dart';
import 'package:mydoctorpage/views/screens/DoctorPagePatientView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoctorpage/views/screens/HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // home: Scaffold(
      //   body: HomePage(),
      // ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/DoctorPagePatientView': (context) => Doctor(),
        '/rdv': (context) => DoctorDoctor(),
      },
    );
  }
}
