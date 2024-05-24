import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class InGame extends StatefulWidget {
  const InGame({super.key});

  @override
  State<InGame> createState() => _InGameState();
}

class _InGameState extends State<InGame> {
  @override
  void initState() {
    super.initState();
    // Initialize total pages when the widget is initialized
    _totalPages = quizData.length;
  }

  void goBack() {
    Navigator.pop(context);
  }

  final List<Map<String, List<String>>> quizData = [
    {
      'What is the capital of France?': ['Paris', 'London', 'Berlin', 'Madrid']
    },
    {
      'What is the capital of Germany?': [
        'Berlin',
        'Munich',
        'Hamburg',
        'Frankfurt'
      ]
    },
    {
      'What is the capital of Spain?': [
        'Madrid',
        'Barcelona',
        'Valencia',
        'Seville'
      ]
    },
    {
      'What is the capital of Italy?': ['Rome', 'Milan', 'Naples', 'Turin']
    },
  ];

  // Define a list to store selected choices for each question
  List<String> selectedChoices = [];

  // Define a PageController
  final PageController _pageController = PageController();

  // Define variables for current and total pages
  int _currentPage = 0;
  int _totalPages = 0;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      goBack();
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${_currentPage + 1}/$_totalPages',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController, // Pass the controller to PageView
                itemCount: quizData.length,
                onPageChanged: (index) {
                  // Update the current page when the page changes
                  setState(() {
                    _currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  // Extract the question and choices from the map
                  String question = quizData[index].keys.first;
                  List<String> choices = quizData[index].values.first;

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        addVerticalSpace(20),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                question,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: choices.map((choice) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Add or remove the choice based on its presence in selectedChoices
                                          if (selectedChoices
                                              .contains(choice)) {
                                            selectedChoices.remove(choice);
                                          } else {
                                            selectedChoices.clear();
                                            selectedChoices.add(choice);
                                          }

                                          // Navigate to the next page
                                          setState(() {
                                            _currentPage = index;
                                          });
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds:
                                                    300), // Optionally, set the duration for the animation
                                            curve: Curves
                                                .ease, // Optionally, set the curve for the animation
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                            if (selectedChoices
                                                .contains(choice)) {
                                              return lightGreen; // Change to your desired color for selected choice
                                            } else {
                                              return orange; // Change to your default button color
                                            }
                                          }),
                                        ),
                                        child: Text(choice),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
