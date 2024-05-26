// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Customize theme and Functions
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';

//Screens
//import 'features/dashboard/views/dashboard_screen.dart';
import 'features/authentication/views/login_screen.dart';
import 'features/onboarding/views/onboarding_screen.dart';
import 'theme/theme_constants.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VisCanLearn',
      theme: lightTheme,
      //home: Login(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Display loading indicator while checking authentication state.
          } else {
            if (isViewed == null || isViewed == 1) {
              // User hasn't viewed the onboarding screen yet, navigate to OnboardingScreen.
              return const OnboardingScreen();
            } else {
              if (snapshot.hasData) {
                // User is logged in, navigate to Dashboard.
                return const Dashboard();
              } else {
                // User is not logged in, navigate to Login.
                return const Login();
              }
            }
          }
        },
      ),
    );
  }
}
