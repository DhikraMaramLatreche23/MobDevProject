import 'package:flutter/material.dart';
import 'package:mydoctorpage/views/screens/login/loginPatient.dart';
import 'package:mydoctorpage/views/screens/signup/signUpPatientPageTwo.dart';


class SignUpPatient extends StatefulWidget {
  const SignUpPatient({super.key});
  static const String pageRoute = '/signUpPatient.dart';

  @override
  State<SignUpPatient> createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
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
                  "Patient",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF03045E),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/twodocs.png",
                  ),
                ),
                const SizedBox(height: 20),
                SocialButton(
                  icon: Icons.g_mobiledata,
                  label: 'Continue with Google',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                SocialButton(
                  icon: Icons.facebook,
                  label: 'Continue with Facebook',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                SocialButton(
                  icon: Icons.apple,
                  label: 'Continue with Apple',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                const Text(
                  'or',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250, // Constrain the button width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignPatient.pageRoute);
                    },
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
                      "Sign Up with email",
                      style: TextStyle(
                        fontSize: 18, // Font size
                        fontWeight: FontWeight.w300, // Font weight
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Loginpatient.pageRoute);
                    },
                    child: const Text(
                      'Have an account? Log in',
                      style: TextStyle(
                        color: Color(0xFF03045E),
                        fontSize: 16,
                        
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250, // Constrain the button width
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color(0xFF03045E),
            padding: const EdgeInsets.symmetric(vertical: 15.0), // Adjust padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
