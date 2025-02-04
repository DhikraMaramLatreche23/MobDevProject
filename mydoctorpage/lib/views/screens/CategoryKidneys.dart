import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/widgets/BottomBar.dart';
import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/CategoryCard.dart';

class CategoryKidneysPage extends StatefulWidget {
  const CategoryKidneysPage({super.key});

  @override
  _CategoryKidneysPageState createState() => _CategoryKidneysPageState();
}

class _CategoryKidneysPageState extends State<CategoryKidneysPage> {
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
      appBar: AppBar(title: const Text('Category'),),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
           const CategoryCard(
            categoryName: "Urologie",
            description: "Choisissez le docteur qui vous convient, spécialisé en Urologie",
            imagePath: "assets/kidneys.png",
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
          //   doctorName: "Dr Nassim Chelighem",
          //   specialty: "Spécialiste en Urologie",
          //   phonenumber: "0553978862",
          //   location: "Zeralda, Alger",
          //   onTap: _onBookAppointment,
          // ),
          // const SizedBox(height: 16),
          // DoctorCard(
          //   doctorName: "Dr Ait Ammour",
          //   specialty: "Spécialiste en Urologie",
          //   phonenumber: "0553123456",
          //   location: "Cheraga, Alger",
          //   onTap: _onBookAppointment,
          // ),
          // const SizedBox(height: 16),
          // DoctorCard(
          //   doctorName: "Dr Cherabi",
          //   specialty: "Spécialiste en Urologie",
          //   phonenumber: "0553546546",
          //   location: "Draria, Alger",
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
