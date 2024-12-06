

import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/DoctorcardModify.dart';
import '../widgets/Calendar.dart';
import 'GenerateSlots.dart';



class DoctorDoctor extends StatefulWidget {
  const DoctorDoctor({super.key});

  @override
  State<DoctorDoctor> createState() => _DoctorDoctorState();
}

class _DoctorDoctorState extends State<DoctorDoctor> {
  int? numOfEmptySlots;
  int ?hourMaxx;


  @override
  Widget build(BuildContext context) {
//     appBar: AppBar(
//   automaticallyImplyLeading: true, 
//   title: const Text(""), 
// );

    return Scaffold(
        appBar: AppBar(title: const Text("")),
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
            DoctorCardModify(),
          
            const SizedBox(height: 20),
            // Padding(padding: EdgeInsets.all(20)),
            Center(
              child: Text(
                "Jours Disponibles",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: dark_blue,
                    fontSize: 20,
                  
                    ),
              ),
            ),
          
            
            Calendar(),
            Padding(padding: EdgeInsets.all(16)),
            
            
               
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
              SizedBox(height: 12),
              if (numOfEmptySlots != null && hourMaxx!= null)
                GenerateSlots(
                  numOfEmptySlots: numOfEmptySlots!,
                  hourMaxx: hourMaxx!,
                ),
          
                SizedBox(height: 20),
              
        

SizedBox(height: 20),

               
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
        width: 110,
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
              icon: Icon(Icons.watch_later_rounded),
            ),
            Expanded(child: Text(label, style: TextStyle(color: Colors.black))),
          ],
        )

          ,
          
          
        ));
  }
}
