import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/dashboard/controllers/dashboard_controller.dart';
import 'package:vis_can_learn/features/dashboard/models/set_model.dart';
import 'package:vis_can_learn/features/dashboard/views/cards_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/create_set.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    super.initState();
    fetchUserId();
    fetchReviewers();
  }

  Map<String, dynamic> data = {};
  String currentUser = '';

  void fetchUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUser = user.email.toString();
      });
    } else {}
  }

  void goToCardScreen(String setId, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CardsScreen(setId: setId, title: title, personId: currentUser),
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

  void goToLibrary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LibraryScreen(),
      ),
    );
  }

  void goToCreateSet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateSet(),
      ),
    );
  }

  void fetchReviewers() async {
    List<Sets> reviewers = await getReviewers(currentUser);
    setState(() {
      data = {
        for (var reviewer in reviewers)
          reviewer.name: {'count': reviewer.count, 'id': reviewer.id}
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:
                    MediaQuery.of(context).size.width, // Set the width to 100%
                decoration: BoxDecoration(
                  gradient: gradientAppbar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              addVerticalSpace(25),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Library",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              "Study Sets",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 30,
                          endIndent: 30,
                          color: lightGreen,
                          thickness: 1.5,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 30.0, top: 20, bottom: 20),
                          child: Text(
                            "All Sets",
                            style: TextStyle(
                              color: orange,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: data.length * 130.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: data.keys.toList().map((key) {
                                return GestureDetector(
                                  onTap: () {
                                    // Handle your tap event here
                                    //print('Card $key clicked');
                                    goToCardScreen(
                                        data[key]['id'], key.toString());
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 40,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: accentGreen,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(key,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          addVerticalSpace(10),
                                          if (data[key] == 1)
                                            Text('${data[key]['count']} term',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                          else
                                            Text('${data[key]['count']} terms',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width:
                    MediaQuery.of(context).size.width, // Set the width to 100%
                height: 65,
                decoration: const BoxDecoration(
                  color: accentGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        goToDashboard(),
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        goToCreateSet();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, // Set the border color
                            width: 2, // Set the border width
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add_rounded,
                          color: orange,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        goToLibrary(),
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder,
                            color: Colors.white,
                          ),
                          Text(
                            'Library',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
