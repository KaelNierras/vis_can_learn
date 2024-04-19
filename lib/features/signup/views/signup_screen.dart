import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_can_learn/common/wiget/InputText.dart';
import 'package:vis_can_learn/features/login/views/login_screen.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int? isViewed;

  @override
  void initState() {
    super.initState();
    //initialization();
  }

  void gotoLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

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
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              addVerticalSpace(30),
              InputText(
                controller: usernameController,
                name: "Username",
                fill: false,
              ),
              addVerticalSpace(15),
              InputText(
                controller: emailController,
                name: "Email",
                fill: false,
              ),
              addVerticalSpace(15),
              InputText(
                controller: passwordController,
                name: "Password",
                fill: false,
              ),
              addVerticalSpace(15),
              InputText(
                controller: confirmPasswordController,
                name: "Confirm Password",
                fill: false,
              ),
              addVerticalSpace(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By registering, you are agreeing to our    \n    Terms of Use and Privacy Policy',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              addVerticalSpace(30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(orange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Minimize border radius
                      ),
                    ),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  addHorizontalSpace(5),
                  GestureDetector(
                    onTap: () {
                      gotoLogIn();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
