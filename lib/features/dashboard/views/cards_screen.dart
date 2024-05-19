import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/dashboard/views/full_card_view.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  void goBack() {
    Navigator.pop(context);
  }

  void goToCardFull() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FullCardView(),
      ),
    );
  }


  Map<String, int> data = {
    'Question 1': 1,
    'Question 2': 2,
    'Question 3': 3,
    'Question 4': 4,
    'Question 5': 5,
    'Question 6': 6,
    'Question 7': 7,
    'Question 8': 8,
    'Question 9': 9,
    // Add more entries as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              goBack();
                            },
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'VSUCAT Reviewer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: IconButton(
                            icon: const Icon(Icons.more_vert),
                            color: Colors.white,
                            onPressed: () {
                              
                            },
                          ),
                        ),
                      ],
                    ),

                    addVerticalSpace(25),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            addVerticalSpace(20),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  String key = data.keys.elementAt(index);
                                  return Stack( // Use Stack to overlay the icon on top of the card
                                    children: [
                                      Container(
                                        width: 300,
                                        margin: const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          color: accentGreen,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                key,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              addVerticalSpace(10),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned( // Position the icon at the bottom right corner
                                        left: 240,
                                        bottom: 10,
                                        right: 10,
                                        child: IconButton(
                                          icon: const Icon(Icons.fullscreen),
                                          color: Colors.white,
                                          onPressed: () {
                                            goToCardFull();
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
