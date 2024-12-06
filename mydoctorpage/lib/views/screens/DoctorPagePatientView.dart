import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import '../widgets/Calendar.dart';
import '../widgets/DoctorCard.dart';
import 'GenerateSlots.dart';




class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  final String phone = "+1234567890";
  int? numOfEmptySlots;
  int ?hourMaxx;


  @override
  Widget build(BuildContext context) {
//     appBar: AppBar(
//   automaticallyImplyLeading: true, 
//   title: const Text(""), 
// );

    return Scaffold(
        // appBar: AppBar(title: const Text("")),
        body: Container(
           decoration: BoxDecoration(
          
          gradient: LinearGradient(
            colors: [
              backgroundGradient1,
              backgroundGradient2,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),

          child: SingleChildScrollView(
              
              child: Column(children: [
            const DoctorCard(),
          
            const SizedBox(height: 20),
            // Padding(padding: EdgeInsets.all(20)),
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
          
            
            const Calendar(),
            const Padding(padding: EdgeInsets.all(16)),
            
            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Morning Button
                  _buildTimeSlotButton("Le matin", 5, 11),
                  // Afternoon Button
                  _buildTimeSlotButton("L'après midi", 5, 14),
                  // Evening Button
                  _buildTimeSlotButton("Le soir", 5, 18),
                ],
              ),
              const SizedBox(height: 12),
              if (numOfEmptySlots != null && hourMaxx!= null)
                GenerateSlots(
                  numOfEmptySlots: numOfEmptySlots!,
                  hourMaxx: hourMaxx!,
                ),
          
                const SizedBox(height: 20),
              
          ElevatedButton(
  onPressed: () {
    Clipboard.setData(ClipboardData(text: phone)); // Copy to clipboard
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Succès",style: TextStyle(color: Colors.green),),
          content: const Text("Vous recevrez une confirmation dans quelques heures."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK",style: TextStyle(color: dark_bleu)),
            ),
          ],
        ),
      );
    });
  
  },
  style: ElevatedButton.styleFrom(
  backgroundColor: dark_bleu, 
  foregroundColor: Colors.white, 
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  elevation: 5,
),

  child: const Text(
    "Prenez un rendez-vous",
    style: TextStyle(
      fontSize: 16, // Font size
      fontWeight: FontWeight.w400, 
      // Bold text
    ),
  ),
)
,
const SizedBox(height: 20),

               
            ],
          ),
                ),
        ),
    );
  }

  InkWell _buildTimeSlotButton(String label, int slots, int hourMax) {
    return InkWell(
      onTap: () {
        setState(() {
          print("$label clicked!");
          numOfEmptySlots = slots;
          hourMaxx = hourMax;
          

        });
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.white.withOpacity(0.2),
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              gradientColor1,
              gradientColor2,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              color: blue,
              icon: const Icon(Icons.watch_later_rounded),
            ),
            Expanded(child: Text(label, style: const TextStyle(color: Colors.black))),
          ],
        )

          ,
          
          
        ));
  }
}
