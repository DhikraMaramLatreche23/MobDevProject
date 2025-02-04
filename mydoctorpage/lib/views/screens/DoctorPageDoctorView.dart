import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/DoctorcardModify.dart';
import '../widgets/CalendarDoctor.dart';

class DoctorDoctor extends StatefulWidget {
  const DoctorDoctor({super.key});

  @override
  State<DoctorDoctor> createState() => _DoctorDoctorState();
}

class _DoctorDoctorState extends State<DoctorDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [backgroundGradient1, backgroundGradient2],
        //     begin: Alignment.bottomRight,
        //     end: Alignment.topLeft,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DoctorCardModify(),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Jours Disponibles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: dark_bleu,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CalendarDoctor(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
