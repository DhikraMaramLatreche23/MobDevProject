import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/signup/signUpDoctorPageOne.dart';
import 'package:mydoctorpage/views/screens/signup/signUpPatientPageOne.dart';

class SignChooseScreen extends StatefulWidget {
  const SignChooseScreen({super.key});

  static const String pageRoute = '/signchoose_screen.dart';

  @override
  State<SignChooseScreen> createState() => _SignChooseScreenState();
}

class _SignChooseScreenState extends State<SignChooseScreen> {
  bool isPatient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset(
                "assets/images/doctorandschedule.png",
              ),
              const SizedBox(height: 20),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF03045E),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Continue as?",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF03045E),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              ToggleButtons(
                isSelected: [isPatient, !isPatient],
                onPressed: (index) {
                  setState(() {
                    isPatient = index == 0;
                  });
                },
                selectedColor:
                    Colors.white, // Text color for the selected button
                color: const Color(
                    0xFF03045E), // Text color for the unselected button
                fillColor: Colors
                    .transparent, // No fill color for the entire container
                borderColor: const Color.fromARGB(
                    141, 0, 118, 182), // Border color for the entire container
                borderRadius: BorderRadius.circular(
                    20.0), // Rounded corners for the buttons
                children: [
                  // Patient Button
                  Container(
                    width: 160.0, // Width of the button
                    height: 50.0, // Height of the button
                    decoration: BoxDecoration(
                      color: isPatient
                          ? const Color(0xFF0077B6)
                          : Colors
                              .transparent, // Change color for the selected button
                      borderRadius: BorderRadius.circular(
                          20.0), // Rounded corners for the button itself
                      border: Border.all(
                        color:
                            Colors.transparent, // Border color for the button
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Text("Patient",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // Doctor Button
                  Container(
                    width: 140.0, // Width of the button
                    height: 50.0, // Height of the button
                    decoration: BoxDecoration(
                      color: !isPatient
                          ? const Color(0xFF0077B6)
                          : Colors
                              .transparent, // Change color for the selected button
                      borderRadius: BorderRadius.circular(
                          20.0), // Rounded corners for the button itself
                      border: Border.all(
                        color:
                            Colors.transparent, // Border color for the button
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Text("Doctor",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  if (isPatient) {
                    Navigator.pushNamed(context, SignUpPatient.pageRoute);
                  } else {
                    Navigator.pushNamed(context, SignUpDoctor.pageRoute);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0077B6), // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 140.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                  elevation: 0, // Shadow effect
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18, // Font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
