import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/themes/colors.dart';

class PatientCard extends StatefulWidget {
  final String name;
  final String img;

  const PatientCard({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
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
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(widget.img,
                          height: 180, width: 150, fit: BoxFit.cover)),
                ],
              ),
              //const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile du patient",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dark_bleu,
                          fontSize: 35),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: dark_bleu,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        style: IconButton.styleFrom(
                          backgroundColor: dark_purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // leed to modify patient page
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "modifier mes info",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: dark_bleu,
                          fontSize: 13,
                        ),
                      )
                    ])
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}
