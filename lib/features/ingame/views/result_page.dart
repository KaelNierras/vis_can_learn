import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/dashboard/views/cards_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
import 'package:vis_can_learn/features/ingame/models/quiz_data_model.dart';
import 'package:vis_can_learn/features/ingame/views/ingame.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class ResultPage extends StatefulWidget {
  final int totalPage;
  final String setId;
  final String title;
  final Map<String, String> correctPage;
  final Map<String, String> wrongPage;
  final List<QuizData> quizData;
  const ResultPage(
      {super.key,
      required this.quizData,
      required this.totalPage,
      required this.correctPage,
      required this.wrongPage, required this.setId, required this.title});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  void goToTestMode() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InGame(setId: widget.setId, title: widget.title),
      ),
    );
  }

  void goToCardScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardsScreen(setId: widget.setId, title: widget.title),
      ),
    );
  }

  void goToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        goToCardScreen();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${widget.quizData.length} / ${widget.quizData.length}",
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
                addVerticalSpace(20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exelent! You know your \nstuff!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 50,
                            ),
                          ],
                        ),
                        addVerticalSpace(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your results',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 110,
                              width: 110,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      showTitle: false,
                                      color: lightGreen,
                                      value: widget.correctPage.length.toDouble(),
                                      radius: 10,
                                    ),
                                    PieChartSectionData(
                                        showTitle: false,
                                        color: orange,
                                        value: widget.wrongPage.length.toDouble(),
                                        radius: 10),
                                  ],
                                ),
                                swapAnimationDuration:
                                    const Duration(milliseconds: 150),
                                swapAnimationCurve: Curves.linear,
                              ),
                            ),
                            addHorizontalSpace(30),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: lightGreen,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      addHorizontalSpace(10),
                                      const Text(
                                        'Correct',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: lightGreen,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${widget.correctPage.length}',
                                                  style: const TextStyle(
                                                    color: lightGreen,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      addHorizontalSpace(10),
                                      const Text(
                                        'Wrong',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: orange,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${widget.wrongPage.length}',
                                                  style: const TextStyle(
                                                    color: orange,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        addVerticalSpace(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Next step',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              goToTestMode();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accentGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/exam.png',
                                  width: 20,
                                  height: 20,
                                ),
                                addHorizontalSpace(20),
                                const Text(
                                  'Take a new test',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        addVerticalSpace(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your answers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        SizedBox(
                          height: widget.quizData.length * 220.0,
                          child: ListView.builder(
                            itemCount: widget.correctPage.length +
                                widget.wrongPage.length,
                            itemBuilder: (context, index) {
                              // Get the keys of the maps
                              List<String> correctKeys =
                                  widget.correctPage.keys.toList();
                              List<String> wrongKeys =
                                  widget.wrongPage.keys.toList();
            
                              // Use the keys to access the values in the maps
                              String question;
                              String answer;
                              Color cardColor;
                              IconData iconData;
                              if (index < correctKeys.length) {
                                question = correctKeys[index];
                                answer = widget.correctPage[question]!;
                                cardColor = lightGreen;
                                iconData = Icons.check;
                              } else {
                                int wrongIndex = index - correctKeys.length;
                                question = wrongKeys[wrongIndex];
                                answer = widget.wrongPage[question]!;
                                cardColor = orange;
                                iconData = Icons.close;
                              }
            
                              return SizedBox(
                                height: 200,
                                child: Card(
                                  color: cardColor,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: ListTile(
                                          title: Text(
                                            'Question: $question\nYour Answer: $answer',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          trailing: Icon(
                                            iconData,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.correctPage.containsKey(question) ? "Correct" : "Incorrect",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
