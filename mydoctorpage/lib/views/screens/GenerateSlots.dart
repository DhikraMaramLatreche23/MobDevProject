import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'DoctorPagePatientView.dart';
import 'dart:math';



class EmptySlot extends StatelessWidget {
  int hourMax;
  EmptySlot({required this.hourMax});

  Duration getRandomTime() {
    final random = Random();
    int hour = random.nextInt(hourMax);
    int min = random.nextInt(60);
    return Duration(hours: hour , minutes: min) ;
  }
  String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes % 60; // To get minutes within the hour

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 30,
      width:70,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child:Text(formatDuration(getRandomTime()).toString())),
    );
  }
}
