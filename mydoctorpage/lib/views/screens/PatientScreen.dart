import 'package:flutter/material.dart';
import '../widgets/Calendar.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import '../widgets/PatientCard.dart';
import '../widgets/BottomBar.dart';
import '../widgets/BottomDrawer.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PatientCard(
                    name: 'moussa Boussekine',
                    img: '/doctor_default_background.png'),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    showCustomBottomDrawer(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dark_purple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Mes rendez-vous",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Calendar(),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  color: purple,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("plus de details sur la date :"),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
