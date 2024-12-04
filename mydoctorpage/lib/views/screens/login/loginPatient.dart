import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/HomePage.dart';



class Loginpatient extends StatefulWidget {
  const Loginpatient({super.key});
  static const String pageRoute = '/loginPatient.dart';


  @override
  State<Loginpatient> createState() => _LoginpatientState();
}

class _LoginpatientState extends State<Loginpatient> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key to manage form validation
  final _formKey = GlobalKey<FormState>();

  // Email validation regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  // Password validation (min 6 characters)
  bool _isValidPassword(String password) {
    return password.length >= 6;
  }

  // Submit form function
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with the sign-up logic
      Navigator.pushNamed(context, HomePage.pageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50), // Space between top and content
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Text(
                    "Log In",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF03045E),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Patient",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF03045E),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: emailController,
                    icon: Icons.email,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!_isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: passwordController,
                    icon: Icons.lock,
                    hintText: 'Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (!_isValidPassword(value)) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 250, // Constrain the button width
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0077B6), // Background color
                        foregroundColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(vertical: 15.0), // Adjust padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0), // Rounded corners
                        ),
                        elevation: 0, // Shadow effect
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 18, // Font size
                          fontWeight: FontWeight.w300, // Font weight
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      "assets/images/twodocs.png",
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        fontSize: 16, // Set font size
        color: Color(0xFF03045E), // Text color
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16, // Font size for the hint text
          fontWeight: FontWeight.w300,
          color: Color(0xFF03045E),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      validator: validator,
    );
  }
}
