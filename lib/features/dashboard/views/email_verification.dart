import 'package:flutter/material.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:flutter/gestures.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  // List to hold the numbers displayed in each box
  List<int> numbers = [1, 8, 4, 6];

  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      // Add functionality for the back button here
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20, right: 69),
                      child: Text(
                        'Email Verification',
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: const Text(
                  "Get Your Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Please enter the 4-digit code sent to your \nemail address.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        child: Center(
                          child: Text(
                            numbers[index].toString(), // Number in the box
                            style: TextStyle(
                              color: background, // Text color
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didn't resend code? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Resend.",
                        style: TextStyle(
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
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Text('VERIFY AND PROCEED'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
