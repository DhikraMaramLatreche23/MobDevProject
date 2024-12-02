import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/widgets/BottomBar.dart';
import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
import 'package:mydoctorpage/views/widgets/CategoryItem.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/screens/DoctorPagePatientView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: ListView(
        children: [
          // Top Section with Gradient Background
          Stack(
            children: [
              Container(
                height: 260,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gradient.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: dark_purple),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: dark_purple),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 16,
                child: const Text(
                  "Trouvez votre\nspécialiste",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: dark_bleu,
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 16,
                right: 16,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Chercher un docteur",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: dark_purple),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Categories Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Catégorie",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: dark_bleu,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem(
                        title: 'Cardiologie',
                        imagePath: 'assets/heart.png',
                      ),
                      CategoryItem(
                        title: 'Dentaire',
                        imagePath: 'assets/tooth.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Doctor Cards Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Doctors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark_bleu,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: dark_bleu,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      DoctorCard(
                        doctorName: "Dr Adam Jones",
                        specialty: "Spécialiste en Cardiologie",
                        phonenumber: "0553978862",
                        location: "Rue des roses 54 lotissement Zhun, Alger",
                        onTap: _onBookAppointment,
                      ),
                      const SizedBox(width: 16),
                      DoctorCard(
                        doctorName: "Dr Sarah Ben",
                        specialty: "Spécialiste en Neurologie",
                        phonenumber: "0553123456",
                        location: "Centre Médical Ibn Sina, Alger",
                        onTap: _onBookAppointment,
                      ),
                      const SizedBox(width: 16),
                      DoctorCard(
                        doctorName: "Dr Yasmine Oud",
                        specialty: "Spécialiste en Dentisterie",
                        phonenumber: "0553546546",
                        location: "Clinique El Amel, Oran",
                        onTap: _onBookAppointment,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
