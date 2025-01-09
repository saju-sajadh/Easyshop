import 'package:flutter/material.dart';
import 'package:EasyShop/common_widgets/app_button.dart';
import 'package:EasyShop/common_widgets/app_text.dart';
import 'package:EasyShop/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = 'assets/images/welcome_image.png';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                icon(),
                const SizedBox(
                  height: 20,
                ),
                welcomeTextWidget(),
                const SizedBox(
                  height: 10,
                ),
                sloganText(),
                const SizedBox(
                  height: 40,
                ),
                getButton(context),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget icon() {
    const iconPath = 'assets/icons/app_icon.svg';
    return SvgPicture.asset(
      iconPath,
      width: 48,
      height: 56,
    );
  }

  Widget welcomeTextWidget() {
    return Column(
      children: const [
        AppText(
          text: 'Welcome',
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: 'to Easyshop',
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: 'Get your grecories as fast as we can',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFC).withOpacity(0.7),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: 'Get Started',
      fontWeight: FontWeight.w600,
      padding: const EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context)
    .pushReplacement<void, void>( MaterialPageRoute(
      builder: (BuildContext context) {
        return const LoginPage();
      },
    ));
  }
}
