import 'package:flutter/material.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';

class FullCardView extends StatefulWidget {
  const FullCardView({super.key});

  @override
  State<FullCardView> createState() => _FullCardViewState();


   
}

class _FullCardViewState extends State<FullCardView> {
  void goBack() {
    Navigator.pop(context);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      goBack();
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, right: 230),
                  child: Text(
                    '2/10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 350, // Adjust the width of the card
                  height: 500, // Adjust the height of the card
                  decoration: BoxDecoration(
                    color: accentGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Question 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
