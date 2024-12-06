import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/widgets/BottomBar.dart';
import 'package:mydoctorpage/views/widgets/CategoryItem.dart';

class Allcategories extends StatefulWidget {
  const Allcategories({super.key});

  @override
  _AllcategoriesState createState() => _AllcategoriesState();
}

class _AllcategoriesState extends State<Allcategories> {
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

  void _onCategoryPage() {
    print("Navigating to Category Page");
    Navigator.pushNamed(context, '/CategoryPage');
  }

  @override
  Widget build(BuildContext context) {
    // Dummy categories data
    final categories = [
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png' ,},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Ophtalmologie', 'imagePath': 'assets/eye.png'},
      {'title': 'Neurologie', 'imagePath': 'assets/brain.png'},
      {'title': 'Orthopidiste', 'imagePath': 'assets/bones.png'},
      {'title': 'Eurologie', 'imagePath': 'assets/kidneys.png'},
      {'title': 'Gastronomie', 'imagePath': 'assets/gastro.png'},
      {'title': 'Pneumologie', 'imagePath': 'assets/lungs.png'},
      {'title': 'Genecologie', 'imagePath': 'assets/geneco.png'},
      {'title': 'Radiologie', 'imagePath': 'assets/radio.png'},
      {'title': 'ORL', 'imagePath': 'assets/orl.png'},
      {'title': 'Endocrinologuie', 'imagePath': 'assets/endocrino.png'},
      {'title': 'Pediatrie', 'imagePath': 'assets/heart.png'},
      {'title': 'Phsychiatrie', 'imagePath': 'assets/tooth.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
      {'title': 'Dentaire', 'imagePath': 'assets/tooth.png'},
      {'title': 'Cardiologie', 'imagePath': 'assets/heart.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(
              title: category['title']!,
              imagePath: category['imagePath']!,
              onTap: () {
                // Handle tap on category item
                print('Tapped on ${category['title']}');
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
