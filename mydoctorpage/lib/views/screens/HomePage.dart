import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/widgets/BottomBar.dart';
import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
import 'package:mydoctorpage/views/widgets/CategoryItem.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/BottomDrawer.dart';

class HomePage extends StatefulWidget {
  static const String pageRoute = "/HomePage";
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

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
          _searchFocusNode.requestFocus();
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

  void _onCategoryPage() {
    print("Navigating to Category Page");
    Navigator.pushNamed(context, '/CategoryPage');
  }

  void _onCategoryHeartPage() {
    print("Navigating to Category heart Page");
    Navigator.pushNamed(context, '/CategoryHeartPage');
  }

  void _onCategoryBrainPage() {
    print("Navigating to Category brain Page");
    Navigator.pushNamed(context, '/CategoryBrainPage');
  }

  void _onCategoryEyePage() {
    print("Navigating to Category eye Page");
    Navigator.pushNamed(context, '/CategoryEyePage');
  }

  void _onCategoryKidneysPage() {
    print("Navigating to Category Urologie Page");
    Navigator.pushNamed(context, '/CategoryKidneysPage');
  }

  void _onCategoryBonesPage() {
    print("Navigating to Category Urologie Page");
    Navigator.pushNamed(context, '/CategoryBonesPage');
  }

  void _onCategoryGastroPage() {
    print("Navigating to Category Urologie Page");
    Navigator.pushNamed(context, '/CategoryGastroPage');
  }

  void _onCategoryPneumoPage() {
    print("Navigating to Category Urologie Page");
    Navigator.pushNamed(context, '/CategoryPneumoPage');
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gradient.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
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
                    IconButton(
                      icon: const Icon(Icons.menu, color: dark_purple),
                      onPressed: () {
                        showCustomBottomDrawer(context);
                      },
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: dark_purple),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 100,
                left: 16,
                child: Text(
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
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: "Chercher un docteur",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: dark_purple),
                      contentPadding: EdgeInsets.symmetric(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Catégorie",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark_bleu,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the "Allcategories" page
                        Navigator.pushNamed(context, '/allcategories');
                      },
                      child: const Text(
                        "Voir Tous",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: dark_purple,
                        ),
                      ),
                    ),
                  ],
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
                        onTap: _onCategoryHeartPage,
                      ),
                      CategoryItem(
                        title: 'Dentaire',
                        imagePath: 'assets/tooth.png',
                        onTap: _onCategoryPage,
                      ),
                      CategoryItem(
                        title: 'Neurologie',
                        imagePath: 'assets/brain.png',
                        onTap: () {
                          print('Category tapped!');
                          Navigator.pushNamed(context, '/CategoryBrainPage');
                        },
                      ),
                      CategoryItem(
                          title: 'Ophtalmologie',
                          imagePath: 'assets/eye.png',
                          onTap: _onCategoryEyePage),
                      CategoryItem(
                        title: 'Pneumologie',
                        imagePath: 'assets/lungs.png',
                        onTap: _onCategoryPneumoPage,
                      ),
                      CategoryItem(
                        title: 'Orthopediste',
                        imagePath: 'assets/bones.png',
                        onTap: _onCategoryBonesPage,
                      ),
                      CategoryItem(
                        title: 'Urologie',
                        imagePath: 'assets/kidneys.png',
                        onTap: _onCategoryKidneysPage,
                      ),
                      CategoryItem(
                        title: 'Gastrologue',
                        imagePath: 'assets/gastro.png',
                        onTap: _onCategoryGastroPage,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
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
