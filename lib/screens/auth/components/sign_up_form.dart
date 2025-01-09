import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../apis/auth_api.dart';
import '../../../model_schema/user_model.dart';
import '../../dashboard/dashboard_screen.dart';
import '../../home/home_screen.dart';
import 'already_have_accout.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  void _signUpWithGoogle(BuildContext context) async {
    try {
      final authAPI = AuthAPI();
      final userCredential = await authAPI.googleSignin();
      if (userCredential != null) {
        debugPrint('Google Sign-Up successful');
        final loggedUser = await authAPI.readCurrentUser();
        if (loggedUser == null) {
          final userData = UserModel(
              uid: userCredential.user?.uid ?? '',
              email: userCredential.user?.email ?? '',
              name: userCredential.user?.displayName ?? '',
              cart: [],
              orders: []);
          await authAPI.createUser(userData);
        }
        Navigator.of(context).pushReplacement<void, void>(MaterialPageRoute(
          builder: (BuildContext context) {
            return DashboardScreen();
          },
        ));
      } else {
        debugPrint('Google Sign-Up Failed');
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.04),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              _signUpWithGoogle(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button background color
              foregroundColor: Colors.black, // Text/icon color
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              side: const BorderSide(color: Colors.black), // Border color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: SvgPicture.asset(
              'assets/icons/google.svg', // Path to your Google icon
              width: 24,
              height: 24,
            ),
            label: const Text(
              'Sign Up with Google',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const AlreadyHaveAnAccount(),
        ],
      ),
    );
  }
}
