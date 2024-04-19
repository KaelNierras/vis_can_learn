// ignore_for_file: library_private_types_in_public_api
import 'package:flutter_native_splash/flutter_native_splash.dart';

//Customize theme and Functions
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Screens
import 'features/dashboard/views/dashboard_screen.dart';
import 'features/onboarding/views/onboarding_screen.dart';
import 'theme/theme_constants.dart';

int? isViewed;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      home: isViewed != 0 ? const OnboardingScreen() : const Dashboard(),
    );
  }
}
