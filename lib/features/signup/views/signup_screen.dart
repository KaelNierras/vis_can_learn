import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/features/authentication/views/login_screen.dart';
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
  }

  void gotoLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  Future<void> createUser(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBar(content: const Text('User created successfully'));
      gotoLogIn();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBar(content: const Text('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        SnackBar(content: const Text('The account already exists for that email.'));
      }
    } catch (e) {
      SnackBar(content: Text('Error: $e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/mountain_bg.png'),
          //   fit: BoxFit.cover, // Adjust the image size
          // ),
        ),
        child: Expanded(
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
                    "Sign Up",
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
                        String email = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                      
                        if (email.isEmpty || !email.contains('@')) {
                          SnackBar(content: const Text('Please enter a valid email'));
                          return;
                        }
                      
                        if (password.isEmpty || password.length < 6) {
                          SnackBar(content: const Text('Password must be at least 6 characters long'));
                          return;
                        }
                      
                        if (confirmPassword != password) {
                          SnackBar(content: const Text('Password does not match'));
                          return;
                        }
                        createUser(email, password);
                      },
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
                              fontWeight: FontWeight.bold, color: orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
