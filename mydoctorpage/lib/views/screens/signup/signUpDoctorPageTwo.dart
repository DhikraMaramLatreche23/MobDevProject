import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc_folders/signup/signup_doctor/bloc/signup_bloc.dart';

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final bloc = context.read<SignupBloc>();
      bloc.add(SignupDoctorPageTwoSubmitted(
        speciality: specialityController.text,
        address: addressController.text,
        phone: phoneController.text,
        description: descriptionController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushNamed(context, '/home');
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png", // Same background image
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 50), // Space between top and content
              child: SingleChildScrollView(
                // Ensures scrolling when keyboard appears
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Détails professionnels", // Translated title
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: specialityController,
                        icon: Icons.person_outline,
                        hintText: 'Spécialité', // Translated hint text
                        validator: (value) => value == null || value.isEmpty
                            ? 'Entrez votre spécialité'
                            : null, // Translated error message
                      ),
                      const SizedBox(
                          height: 15), // Reduced space between fields
                      CustomTextField(
                        controller: addressController,
                        icon: Icons.location_on_outlined,
                        hintText: 'Adresse', // Translated hint text
                        validator: (value) => value == null || value.isEmpty
                            ? 'Entrez votre adresse'
                            : null, // Translated error message
                      ),
                      const SizedBox(
                          height: 15), // Reduced space between fields
                      CustomTextField(
                        controller: phoneController,
                        icon: Icons.phone_outlined,
                        hintText: 'Numéro de téléphone', // Translated hint text
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre numéro de téléphone'; // Translated error message
                          }
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Entrez un numéro valide'; // Translated error message
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                          height: 15), // Reduced space between fields
                      CustomTextField(
                        controller: descriptionController,
                        icon: Icons.description_outlined,
                        hintText: 'Description', // Translated hint text
                        validator: (value) => value == null || value.isEmpty
                            ? 'Entrez une description'
                            : null, // Translated error message
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF03045E),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Soumettre',
                          style: TextStyle(fontSize: 20),
                        ), // Translated button text
                      ),

                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          "assets/images/twodocs.png", // Same image
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 40.0), // Padding for horizontal spacing
      child: TextFormField(
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        validator: validator,
      ),
    );
  }
}
