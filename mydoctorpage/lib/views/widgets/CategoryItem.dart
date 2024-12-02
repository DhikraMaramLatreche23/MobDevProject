// import 'package:flutter/material.dart';

// class CategoryItem extends StatelessWidget {
//   final String title;
//   final IconData icon;

//   const CategoryItem({
//     Key? key,
//     required this.title,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100, // Adjust the width as needed
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 30, // Adjust the radius as needed
//             backgroundColor: Colors.blue[100], // Background color for the icon
//             child: Icon(
//               icon,
//               size: 40,
//               color: Colors.blue, // Icon color
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
