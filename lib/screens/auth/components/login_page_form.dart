import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../apis/auth_api.dart';
import '../../dashboard/dashboard_screen.dart';
import './app_themes.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({super.key});

  void onLoginWithGoogle(BuildContext context) async {
    try {
      final authAPI = AuthAPI();
      final userCredential = await authAPI.googleSignin();
      if (userCredential != null) {
        debugPrint('Google Sign-Up successful');
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
    return Theme(
      data: AppTheme.defaultTheme,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){
                onLoginWithGoogle(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: SvgPicture.asset(
                'assets/icons/google.svg', 
                width: 24,
                height: 24,
              ),
              label: const Text(
                'Login with Google',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Forget Password?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
