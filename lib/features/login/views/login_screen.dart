import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

import 'package:vis_can_learn/features/signup/views/signup_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int? isViewed;

  @override
  void initState() {
    super.initState();
    //initialization();
  }

   void gotoSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
  }


  // //Splash Screen Initialization
  // void initialization() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/mountain_bg.png'),
          //   fit: BoxFit.cover, // Adjust the image size
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(
                MediaQuery.of(context).size.height / 5,
              ),
              const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              addVerticalSpace(30),
              InputText(
                controller: usernameController,
                name: "Username",
                fill: false,
              ),
              addVerticalSpace(10),
              InputText(
                controller: passwordController,
                name: "Password",
                fill: false,
              ),
              addVerticalSpace(20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Text('Log In'),
                ),
              ),
              addVerticalSpace(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Add padding to the left and right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    addHorizontalSpace(10),
                    const Text(
                      "OR",
                      style: TextStyle(color: Colors.white),
                    ),
                    addHorizontalSpace(10),
                    const Expanded(
                      child: Divider(
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Colors.transparent),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_icon.png',
                        width: 20,
                        height: 20,
                      ),
                      addHorizontalSpace(10),
                      const Text('Log In with Google'),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  addHorizontalSpace(5),
                  GestureDetector(
                    onTap: () {
                     gotoSignUp();
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: orange
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
