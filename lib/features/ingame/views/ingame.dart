import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/ingame/models/quiz_data_model.dart';
import 'package:vis_can_learn/features/ingame/views/result_page.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class InGame extends StatefulWidget {
  final String setId;
  final String title;

  const InGame({super.key, required this.setId, required this.title});

  @override
  State<InGame> createState() => _InGameState();
}

class _InGameState extends State<InGame> {
  @override
  void initState() {
    super.initState();
    getData(widget.setId);
  }

  void goBack() {
    Navigator.pop(context);
  }

  void calculateResult() {
    correctPage.clear();
    wrongPage.clear();

    // Calculate the correct and wrong answers
    for (var i = 0; i < quizData.length; i++) {
      var selectedChoice = selectedChoices[quizData[i].question];
      var correctAnswer = correctAnswers[quizData[i].question];

      if (selectedChoice == null || correctAnswer == null) {
        continue;
      }

      if (selectedChoice == correctAnswer) {
        correctPage[quizData[i].question] = selectedChoice;
      } else {
        wrongPage[quizData[i].question] = selectedChoice;
      }
    }
  }

  void goToResult() {
    if (selectedChoices.length != _totalPages) {
      return;
    } else {
      //Navigate to the result page
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              totalPage: _totalPages,
              correctPage: correctPage,
              wrongPage: wrongPage,
              quizData: quizData,
              setId: widget.setId,
              title: widget.title,
            ),
          ));
    }
  }

  Future<void> getData(String setId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionRef =
        firestore.collection('sets');

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionRef.where('set_id', isEqualTo: setId).get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> setData = querySnapshot.docs.first.data();
      List<dynamic> setArray = setData['set_array'];
      setState(() {
        quizData.clear();
        correctAnswers.clear(); // Clear the correctAnswers map
        for (var i = 0; i < setArray.length; i++) {
          List<String> allChoices =
              setArray.map((item) => item['definition'].toString()).toList();
          // Ensure we only have 4 choices max
          while (allChoices.length > 4) {
            allChoices
                .removeAt(0); // or change this to remove at a random index
          }
          // Ensure the correct answer is in the choices
          if (!allChoices.contains(setArray[i]['definition'].toString())) {
            allChoices[0] = setArray[i]['definition'].toString();
          }
          allChoices.shuffle(); // Shuffle the choices
          quizData.add(QuizData(
            question: setArray[i]['term'],
            choices: allChoices,
          ));
          correctAnswers[setArray[i]['term']] = setArray[i]['definition']
              .toString(); // Add the correct answer to the map
        }
        _totalPages = quizData.length;
      });
    } else {
      throw Exception("No such document.");
    }
  }

  final List<QuizData> quizData = [];
  Map<String, String> correctPage = {};
  Map<String, String> wrongPage = {};
  Map<String, String> correctAnswers = {};

  // Define a list to store selected choices for each question
  Map<String, String> selectedChoices = {};

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
        child: SafeArea(
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
                    if (_currentPage == _totalPages - 1) ...[
                      IconButton(
                        onPressed: () {
                          calculateResult();
                          goToResult();
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      )
                    ]
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller:
                      _pageController, // Pass the controller to PageView
                  itemCount: quizData.length,
                  onPageChanged: (index) {
                    // Update the current page when the page changes
                    setState(() {
                      _currentPage = index;
                    });
                  },

                  itemBuilder: (context, index) {
                    // Extract the question and choices from the map
                    String question = quizData[index].question;
                    List<String> choices = quizData[index].choices;

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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: choices.map((choice) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add or remove the choice based on its presence in selectedChoices

                                            // Navigate to the next page
                                            setState(() {
                                              _currentPage = index;

                                              selectedChoices[question] =
                                                  choice;
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
                                            backgroundColor: WidgetStateProperty
                                                .resolveWith<Color>(
                                                    (Set<WidgetState> states) {
                                              if (selectedChoices[question] ==
                                                  choice) {
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
      ),
    );
  }
}
