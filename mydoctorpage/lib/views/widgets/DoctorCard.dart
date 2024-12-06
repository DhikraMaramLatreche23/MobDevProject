import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/themes/colors.dart';


class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      color: blue,
                                      icon: Icon(Icons.phone)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      color: blue,
                                      icon: Icon(Icons.pin_drop)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {});
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
                      ))]
                ));
}}
