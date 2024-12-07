import 'package:flutter/material.dart';
import '../widgets/Calendar.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import '../widgets/PatientCard.dart';
import '../widgets/BottomBar.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int _currentIndex = 0;
  bool _showAppointmentDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                const SizedBox(height: 25),
                const PatientCard(
                  name: 'Moussa Boussekine',
                  img: '/doctor_default_background.png',
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showAppointmentDetails = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dark_purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 25),
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
                const SizedBox(height: 50),
                Calendar(),
                const SizedBox(height: 50),
                if (_showAppointmentDetails)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Plus de details sur la date :",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(1.2),
                            2: FlexColumnWidth(1.2),
                            3: FlexColumnWidth(1.5),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            _createTableRow(
                                '08:45', 'Adam', 'Neuro', 'Abd Allah'),
                            const TableRow(
                              children: [
                                SizedBox(height: 16),
                                SizedBox(),
                                SizedBox(),
                                SizedBox(),
                              ],
                            ),
                            _createTableRow(
                                '14:30', 'Samir', 'Dentist', 'Alg Centre'),
                          ],
                        ),
                      ),
                    ],
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

  TableRow _createTableRow(
      String time, String doctor, String specialty, String location) {
    return TableRow(
      children: [
        _appointmentInfoCell(title: 'L\'heure', value: time),
        _appointmentInfoCell(title: 'Le medecin', value: doctor),
        _appointmentInfoCell(title: 'Spécialité', value: specialty),
        _appointmentInfoCell(title: 'Localisation', value: location),
      ],
    );
  }

  Widget _appointmentInfoCell({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: dark_bleu,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(52, 105, 80, 124), // Background color
              borderRadius: BorderRadius.circular(8), // Border radius
            ),
            padding: const EdgeInsets.all(6.0), // Padding inside the container
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: dark_bleu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
