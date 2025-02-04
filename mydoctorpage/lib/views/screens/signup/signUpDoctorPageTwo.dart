
import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/HomePage.dart';


class SignDoctor extends StatefulWidget {
  const SignDoctor({super.key});
  static const String pageRoute = '/signUpDoctorPageTwo.dart';

  @override
  State<SignDoctor> createState() => _SignDoctorState();
}

class _SignDoctorState extends State<SignDoctor> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for each field
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Validators for form fields
  String? _validateSpeciality(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your specialty';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  }

  // Submit form
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
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
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              key: _formKey, // Form key for validation
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Text(
                    "Sign Up",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF03045E),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Doctor",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF03045E),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: specialityController,
                    icon: Icons.person_outline,
                    hintText: 'Speciality',
                    validator: _validateSpeciality,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: addressController,
                    icon: Icons.location_on_outlined,
                    hintText: 'Address',
                    validator: _validateAddress,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: phoneController,
                    icon: Icons.phone_outlined,
                    hintText: 'Phone Number',
                    isPassword: false,
                    validator: _validatePhoneNumber,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: descriptionController,
                    icon: Icons.description_outlined,
                    hintText: 'Description',
                    isPassword: false,
                    validator: _validateDescription,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0077B6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
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
  final FormFieldValidator<String> validator;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF03045E),
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
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
    );
  }
}

