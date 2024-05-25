import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
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
  }

  void gotoSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
  }

  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      goToDashboard();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      }
    }
  }

  void goToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Dashboard(),
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
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        height: MediaQuery.of(context).size.height, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/mountain_bg.png'),
          //   fit: BoxFit.cover, // Adjust the image size
          // ),
        ),
        child: SingleChildScrollView(
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
                  controller: emailController,
                  name: "Email",
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
                    onPressed: () async {
                      login(emailController.text, passwordController.text);
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
                        style:
                            TextStyle(fontWeight: FontWeight.bold, color: orange),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
