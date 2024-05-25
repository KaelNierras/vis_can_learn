import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/dashboard/views/create_set.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/library_screen.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void goToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dashboard(),
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

  void goBack() {
    Navigator.pop(context);
  }

  void goToLibrary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LibraryScreen(),
      ),
    );
  }

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
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: goBack,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 45,
                                width: MediaQuery.of(context).size.width - 110,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white), // This changes the input text color
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(color: Colors.white, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: lightGreen,
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(color: Colors.white), // This changes the hint text color
                                  ),
                                  onSubmitted: (value) {
                                    // Call your search function here
                                    // Search(value);
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enter a topic or keyword',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width, // Set the width to 100%
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
    );
  }
}
