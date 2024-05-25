import 'package:flutter/material.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

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
                        'Reset Password',
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
                  "Enter New Password",
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
                  "Your new password must be different from \n your previous password.",
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
                    controller: passwordController,
                    name: "Password",
                    fill: false,
                  ),
                  addVerticalSpace(25),
                  InputText(
                    controller: confirmPasswordController,
                    name: "Confirm Password",
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
                  child: const Text('CONTINUE'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
