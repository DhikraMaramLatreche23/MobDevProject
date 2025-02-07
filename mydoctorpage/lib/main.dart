import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/AllCategories.dart';
import 'package:mydoctorpage/views/screens/DoctorPageDoctorView.dart';
import 'package:mydoctorpage/views/screens/DoctorPagePatientView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoctorpage/views/screens/HomePage.dart';
import 'package:mydoctorpage/views/screens/CategoryPage.dart';

import 'package:mydoctorpage/views/screens/CategoryHeart.dart';
import 'package:mydoctorpage/views/screens/CategoryBrain.dart';
import 'package:mydoctorpage/views/screens/CategoryEye.dart';
import 'package:mydoctorpage/views/screens/CategoryKidneys.dart';
import 'package:mydoctorpage/views/screens/CategoryGastro.dart';
import 'package:mydoctorpage/views/screens/CategoryBones.dart';
import 'package:mydoctorpage/views/screens/CategoryPneumo.dart';
import 'views/screens/signchoose_screen/signchoose_screen.dart';
import 'package:mydoctorpage/views/screens/doc_modify_profile.dart';
import 'views/screens/signup/signUpDoctorPageOne.dart';
import 'views/screens/signup/signUpPatientPageOne.dart';
import 'views/screens/signup/signUpPatientPageTwo.dart';
import 'views/screens/signup/signUpDoctorPageTwo.dart';
import 'views/screens/login/loginDoctor.dart';
import 'views/screens/login/loginPatient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydoctorpage/bloc/category_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CategoryBloc(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SignChooseScreen(),
      routes: {
        // HomePage.pageRoute: (ctx) => const HomePage(),
        SignChooseScreen.pageRoute: (ctx) => const SignChooseScreen(),
        SignUpPatient.pageRoute: (ctx) => const SignUpPatient(),
        SignPatient.pageRoute: (ctx) => const SignPatient(),
        SignUpDoctor.pageRoute: (ctx) => const SignUpDoctor(),
        SignDoctor.pageRoute: (ctx) => const SignDoctor(),
        Logindoctor.pageRoute: (ctx) => const Logindoctor(),
        Loginpatient.pageRoute: (ctx) => const Loginpatient(),
        '/home': (context) => const HomePage(),
        HomePage.routeName: (context) => const HomePage(),
        '/DoctorPagePatientView': (context) => const DoctorPage(),
        '/rdv': (context) => const DoctorDoctor(),
        '/allcategories': (context) => const Allcategories(),
        '/doc_modify_profile': (context) => const DocModifyProfile(),
        '/CategoryPage': (context) => BlocProvider.value(
              value: BlocProvider.of<CategoryBloc>(context),
              child: const CategoryPage(),
            ),
      },
    );
  }
}
