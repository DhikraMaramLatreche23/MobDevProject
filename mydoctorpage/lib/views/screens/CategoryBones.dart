import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/widgets/BottomBar.dart';
// import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/CategoryCard.dart';

class CategoryBonesPage extends StatefulWidget {
  const CategoryBonesPage({super.key});

  @override
  _CategoryBonesPageState createState() => _CategoryBonesPageState();
}

class _CategoryBonesPageState extends State<CategoryBonesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigation logic here
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/rdv');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/searchDoctor');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/notifications');
          break;
        case 4:
          Navigator.pushReplacementNamed(context, '/settings');
          break;
      }
    });
  }

  void _onBookAppointment() {
    Navigator.pushNamed(context, '/DoctorPagePatientView');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CategoryCard(
            categoryName: "Orthopidie",
            description:
                "Choisissez le docteur qui vous convient, spécialisé en Orthopidie",
            imagePath: "assets/bones.png",
          ),
          const Text(
            "Doctors in this Category",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: dark_bleu,
            ),
          ),
          const SizedBox(height: 16),
          // DoctorCard(
          //   doctorName: "Dr Zair Youcef",
          //   specialty: "Spécialiste en Orthopidie",
          //   phonenumber: "0553978862",
          //   location: "Rue des roses 54 lotissement Zhun, Alger",
          //   onTap: _onBookAppointment,
          // ),
          // const SizedBox(height: 16),
          // DoctorCard(
          //   doctorName: "Dr Boutasta Tarek",
          //   specialty: "Spécialiste en Orthopidie",
          //   phonenumber: "0553123456",
          //   location: "Centre Médical Ibn Sina, Alger",
          //   onTap: _onBookAppointment,
          // ),
          // const SizedBox(height: 16),
          // DoctorCard(
          //   doctorName: "Dr Benbrahim",
          //   specialty: "Spécialiste en Orthopidie",
          //   phonenumber: "0553546546",
          //   location: "Clinique El Amel, Oran",
          //   onTap: _onBookAppointment,
          // ),
          // DoctorCard(
          //   doctorName: "Dr Talbi Yacine",
          //   specialty: "Spécialiste en Chirugie Orthopidie",
          //   phonenumber: "0553546546",
          //   location: "Clinique El Amel, Oran",
          //   onTap: _onBookAppointment,
          // ),          
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
