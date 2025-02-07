// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mydoctorpage/bloc/category_bloc.dart';
// import 'package:mydoctorpage/views/widgets/BottomBar.dart';
// import 'package:mydoctorpage/views/themes/colors.dart';
// import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
// import 'package:mydoctorpage/views/widgets/CategoryCard.dart';
// import 'package:mydoctorpage/bloc/category_event.dart';
// import 'package:mydoctorpage/bloc/category_state.dart';

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoryBloc, CategoryState>(
//       builder: (context, state) {
//         if (state is CategorySelected) {
//           final category = state.category;

//           return Scaffold(
//             appBar: AppBar(
//               title: Text("$category['name']"),
//             ),
//             body: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 CategoryCard(
//                   categoryName: category['name'],
//                   description: category['description'],
//                   imagePath: category['imagePath'],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Doctors in this Category",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: dark_bleu,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 // Add doctor list dynamically based on category
//                 // Example:
//                 // DoctorCard(
//                 //   doctorName: "Dr. Example",
//                 //   specialty: category['name'],
//                 //   ...other details
//                 // )
//               ],
//             ),
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mydoctorpage/bloc/category_bloc.dart';
// import 'package:mydoctorpage/bloc/category_state.dart';

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final category = context.read<CategoryBloc>().state;
//     String categoryName = '';
//     String description = '';
//     String imagePath = '';

//     if (category is CategorySelected) {
//       categoryName = category.selectedCategory['name'] ?? 'Unknown';
//       description = category.selectedCategory['description'] ?? '';
//       imagePath = category.selectedCategory['imagePath'] ?? '';
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryName),
//       ),
//       body: Column(
//         children: [
//           Image.asset(imagePath, height: 150),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               description,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 // Replace with actual data fetching and mapping
//                 ListTile(
//                   title: const Text('Doctor Name'),
//                   subtitle: const Text('Specialty'),
//                   onTap: () {
//                     // Navigate to doctor details page
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//WORKS NHAR lab
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mydoctorpage/bloc/category_bloc.dart';
// import 'package:mydoctorpage/bloc/category_state.dart';

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoryBloc, CategoryState>(
//       builder: (context, state) {
//         if (state is CategorySelected) {
//           final categoryName = state.selectedCategory['name'] ?? 'Unknown';
//           final description = state.selectedCategory['description'] ?? '';
//           final imagePath = state.selectedCategory['imagePath'] ?? '';

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(categoryName),
//             ),
//             body: Column(
//               children: [
//                 Image.asset(imagePath, height: 150),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     description,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       ListTile(
//                         title: const Text('Doctor Name'),
//                         subtitle: const Text('Specialty'),
//                         onTap: () {
//                           // Navigate to doctor details page
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }

//WORKS WITH BLOOOOOOOOOOOC
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mydoctorpage/bloc/category_bloc.dart';
// import 'package:mydoctorpage/bloc/category_state.dart' as state;

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoryBloc, state.CategoryState>(
//       builder: (context, currentState) {
//         // Renamed `state` to `currentState` for clarity
//         if (currentState is state.CategorySelected) {
//           // Use the alias `state`
//           final categoryName =
//               currentState.selectedCategory['name'] ?? 'Unknown';
//           final description =
//               currentState.selectedCategory['description'] ?? '';
//           final imagePath = currentState.selectedCategory['imagePath'] ?? '';

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(categoryName),
//             ),
//             body: Column(
//               children: [
//                 Image.asset(imagePath, height: 150),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     description,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       ListTile(
//                         title: const Text('Doctor Name'),
//                         subtitle: const Text('Specialty'),
//                         onTap: () {
//                           // Navigate to doctor details page
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydoctorpage/bloc/category_bloc.dart';
import 'package:mydoctorpage/bloc/category_state.dart';
import 'package:mydoctorpage/views/themes/colors.dart';
import 'package:mydoctorpage/views/widgets/CategoryCard.dart';
import 'package:mydoctorpage/views/widgets/DoctorWidget.dart';
import 'package:mydoctorpage/bloc/doctor_bloc.dart';
//import 'package:mydoctorpage/bloc/doctor_state.dart';

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoryBloc, state.CategoryState>(
//       builder: (context, currentState) {
//         if (currentState is state.CategorySelected) {
//           final category = currentState.selectedCategory;
//           final categoryName = category['name'] ?? 'Unknown';
//           final description = category['description'] ?? '';
//           final imagePath = category['imagePath'] ?? '';
//           final doctors = category['doctors'] ?? []; // Doctors list

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(categoryName),
//               backgroundColor: dark_bleu,
//             ),
//             body: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 // Category Details Card
//                 CategoryCard(
//                   categoryName: categoryName,
//                   description: description,
//                   imagePath: imagePath,
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Doctors in this Category",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: dark_bleu,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Doctors List
//                 ...doctors.map<Widget>((doctor) {
//                   return DoctorCard(
//                     doctorName: doctor['name'],
//                     specialty: doctor['specialty'],
//                     phonenumber: doctor['phone'],
//                     location: doctor['location'],
//                     onTap: () {
//                       // Navigate to doctor details page
//                     },
//                   );
//                 }).toList(),
//               ],
//             ),
//           );
//         }
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
// }

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => DoctorBloc()..add(FetchDoctors())),
//         BlocProvider(create: (_) => CategoryBloc()),
//       ],
//       child: BlocBuilder<CategoryBloc, CategoryState>(
//         builder: (context, currentState) {
//           if (currentState is CategorySelected) {
//             final categoryName =
//                 currentState.selectedCategory['name'] ?? 'Unknown';
//             final description =
//                 currentState.selectedCategory['description'] ?? '';
//             final imagePath = currentState.selectedCategory['imagePath'] ?? '';

//             return Scaffold(
//               appBar: AppBar(
//                 title: Text(categoryName),
//                 backgroundColor: Colors.white,
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CategoryCard(
//                       categoryName: categoryName,
//                       description: description,
//                       imagePath: imagePath,
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       "Doctors in this Category",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: dark_bleu,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: BlocBuilder<DoctorBloc, DoctorState>(
//                         builder: (context, doctorState) {
//                           if (doctorState is DoctorLoading) {
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           } else if (doctorState is DoctorLoaded) {
//                             final doctors = doctorState.doctors
//                                 .where((doctor) =>
//                                     doctor['speciality'] == categoryName)
//                                 .toList();
//                             if (doctors.isEmpty) {
//                               return const Center(
//                                   child: Text(
//                                       "No doctors available in this category."));
//                             }
//                             return ListView.builder(
//                               itemCount: doctors.length,
//                               itemBuilder: (context, index) {
//                                 final doctor = doctors[index];
//                                 return DoctorCard(
//                                   doctorName: doctor['name'] ?? 'Unknown',
//                                   specialty:
//                                       doctor['speciality'] ?? 'No Specialty',
//                                   phonenumber: doctor['phonenumber'] ??
//                                       'No Phone Number',
//                                   location:
//                                       doctor['address'] ?? 'Unknown Address',
//                                   onTap: () {
//                                     Navigator.pushNamed(
//                                       context,
//                                       '/DoctorPagePatientView',
//                                       arguments: doctor,
//                                     );
//                                   },
//                                 );
//                               },
//                             );
//                           } else {
//                             return const Center(
//                                 child: Text("Failed to load doctors"));
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         },
//       ),
//     );
//   }
// }

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DoctorBloc()..add(FetchDoctors())),
        // BlocProvider(create: (_) => CategoryBloc()..add(SelectCategory())),
      ],
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, currentState) {
          if (currentState is CategorySelected) {
            final categoryName =
                currentState.selectedCategory['name'] ?? 'Unknown';
            final description =
                currentState.selectedCategory['description'] ?? '';
            final imagePath = currentState.selectedCategory['imagePath'] ?? '';

            return Scaffold(
              appBar: AppBar(
                title: Text(categoryName),
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCard(
                      categoryName: categoryName,
                      description: description,
                      imagePath: imagePath,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Doctors in this Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark_bleu,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: BlocBuilder<DoctorBloc, DoctorState>(
                        builder: (context, doctorState) {
                          if (doctorState is DoctorLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (doctorState is DoctorLoaded) {
                            final doctors = doctorState.doctors
                                .where((doctor) =>
                                    doctor['speciality'] == categoryName)
                                .toList();
                            if (doctors.isEmpty) {
                              return const Center(
                                  child: Text(
                                      "No doctors available in this category."));
                            }
                            return ListView.builder(
                              itemCount: doctors.length,
                              itemBuilder: (context, index) {
                                final doctor = doctors[index];
                                return DoctorCard(
                                  doctorName: doctor['name'] ?? 'Unknown',
                                  specialty:
                                      doctor['speciality'] ?? 'No Specialty',
                                  phonenumber: doctor['phonenumber'] ??
                                      'No Phone Number',
                                  location:
                                      doctor['address'] ?? 'Unknown Address',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/DoctorPagePatientView',
                                      arguments: doctor,
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text("Failed to load doctors"));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
