import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

void openGoogleMaps(double latitude, double longitude) async {
  final Uri googleMapsUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

  if (await canLaunchUrl(googleMapsUri)) {
    await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Google Maps';
  }
}

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  final String phone = "+1234567890";
  final String email = "insaf.del3@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/th.jpeg',
                          height: 200, width: 150, fit: BoxFit.cover)),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dr Adam Jones",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 35),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Specialiste en cardiologie",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text: phone)); // Copy to clipboard
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text(
                                      "Phone number $phone copied to clipboard."),
                                ),
                              );
                              // Automatically dismiss the dialog after 2 seconds
                              Future.delayed(Duration(seconds: 1), () {
                                if (Navigator.canPop(context)) {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                }
                              });
                            },
                            color: blue,
                            icon: Icon(Icons.phone),
                          ),
                          IconButton(
                              onPressed: () {
                                openGoogleMaps(37.7749, -122.4194);
                              },
                              color: blue,
                              icon: Icon(Icons.pin_drop)),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: email)); // Copy to clipboard
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                        "Email $email copied to clipboard."),
                                  ),
                                );
                                // Automatically dismiss the dialog after 2 seconds
                                Future.delayed(Duration(seconds: 1), () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  }
                                });
                              },
                              color: blue,
                              icon: Icon(Icons.email)),
                        ])
                  ],
                ),
              )
            ],
          ),
          const SizedBox(width: 25),
          Container(
              margin: EdgeInsets.all(7),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          "Dr Adam, cardiologue expérimenté, spécialisé en soins et suivi des maladies cardiaques. Il offre des consultations personnalisées pour une meilleure santé cardiovasculaire."))
                ],
              ))
        ]));
  }
}
