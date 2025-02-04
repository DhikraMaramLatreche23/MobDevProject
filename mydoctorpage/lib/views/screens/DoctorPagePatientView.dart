import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydoctorpage/views/screens/GenerateSlots.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/CalendarDoctor.dart';
import 'package:mydoctorpage/views/widgets/CalendarPatient.dart';
import 'package:mydoctorpage/views/widgets/DoctorIntro.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'DoctorIntro.dart';  // Import DoctorIntro

void openGoogleMaps(double latitude, double longitude) async {
  final Uri googleMapsUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

  if (await canLaunchUrl(googleMapsUri)) {
    await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Google Maps';
  }
}

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  int? numOfEmptySlots;
  int? hourMaxx;

  @override
  Widget build(BuildContext context) {
    // Get doctor data from arguments
    final doctor =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
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
          child: Column(
            children: [
              // Doctor Intro with data passed from DoctorListScreen
              DoctorIntro(
                name: doctor['name'] ?? 'Unknown',
                surname: doctor['surname'] ?? 'Unknown',
                speciality: doctor['speciality'] ?? 'No Speciality',
                phone: doctor['phonenumber'] ?? 'No Phone Number',
                email: doctor['email'] ?? 'No Email',
                address: doctor['address'] ?? 'Unknown Address',
                image: doctor['image'] ?? 'assets/th.jpeg',
                description:
                    doctor['description'] ?? 'No description available',
              ),

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
               CalendarPatient(),
              const Padding(padding: EdgeInsets.all(16)),
              // Time Slot Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeSlotButton("Le matin", 5, 11),
                  _buildTimeSlotButton("L'après midi", 5, 14),
                  _buildTimeSlotButton("Le soir", 5, 18),
                ],
              ),
              const SizedBox(height: 12),
              if (numOfEmptySlots != null && hourMaxx != null)
                GenerateSlots(
                  numOfEmptySlots: numOfEmptySlots!,
                  hourMaxx: hourMaxx!,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                      text: doctor['phone'])); // Copy to clipboard
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Succès",
                          style: TextStyle(color: Colors.green),
                        ),
                        content: const Text(
                            "Vous recevrez une confirmation dans quelques heures."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child:
                                Text("OK", style: TextStyle(color: dark_bleu)),
                          ),
                        ],
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: dark_bleu,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Prenez un rendez-vous",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
            Expanded(
                child:
                    Text(label, style: const TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
// 