import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/auth_controller.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'widget/bottom_navbar.dart';
import './screens/landing_screen.dart';
import 'widget/error_page.dart';
import 'widget/loading_page.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      theme: ThemeData.light(),
      // home: LandingScreen(),
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if(user != null){ 
              return  BottomNavBar();
            }
            return const LandingScreen();
          },
          error: (error, st) {
            print(error);
            return ServerDownPage();
          },
          loading: () => const LoadingPage()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => BottomNavBar(),
        '/signup': (context) => SignupScreen(),
        '/signin': (context) => LoginScreen(),
      },
    );
  }
}
