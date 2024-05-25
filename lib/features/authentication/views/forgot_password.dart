import 'package:flutter/material.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';
import 'package:flutter/gestures.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      // Add functionality for the back button here
                    },
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, right: 69),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Mail Address Here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Enter the email address associated with \n your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(30),
                  InputText(
                    controller: emailController,
                    name: "Email",
                    fill: false,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Text('RECOVER PASSWORD'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Log In.",
                        style: const TextStyle(
                          color: Colors.white, // Color for the clickable text
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap event
                          },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
