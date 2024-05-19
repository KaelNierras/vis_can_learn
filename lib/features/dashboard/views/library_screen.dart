import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void Search() {
    print('Search');
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

  Map<String, int> data = {
    'VSU Reviewer': 256,
    '(Draft) Untitled Set': 5,
    // Add more entries as needed
  };

  String selectedFilter = 'All';

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
            Container(
              width: MediaQuery.of(context).size.width, // Set the width to 100%
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: const Text(
                        "Library",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: const Text(
                          "Study Sets",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 30,
                      endIndent: 30,
                      color: lightGreen,
                      thickness: 1.5,
                    ),

                    Row(
                      children: [
                        SizedBox(width: 30),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lightGreen, // Choose your border color
                              width: 1.2, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(4.0), // Adjust border radius as needed
                          ),
                          child: DropdownButton<String>(
                            value: selectedFilter,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedFilter = newValue!;
                              });
                            },
                            dropdownColor: Colors.grey[800], // Set the background color of the dropdown menu
                            style: TextStyle(color: Colors.white), // Set the text color of the dropdown button
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Set the color of the dropdown icon
                            items: <String>['All', 'In Progress', 'Today'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors.white, // Set the text color of the dropdown choices
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(width: 70),

                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 210,
                              child: ElevatedButton(
                                onPressed: Search,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(lightGreen),
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Set the border radius here
                                  )),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                    ),
                                    Text(
                                      'Search Sets...',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(244, 218, 218, 218),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 20, bottom: 20),
                      child: const Text(
                        "In progress",
                        style: TextStyle(
                          color: orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.entries.map((MapEntry<String, int> entry) {
                        String key = entry.key;
                        int value = entry.value;
                        return Container(
                          width: MediaQuery.of(context).size.width - 70,
                          height: 90,
                          margin: const EdgeInsets.only(left: 30, bottom: 20),
                          decoration: BoxDecoration(
                            color: accentGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  key,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '$value Terms',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 20),
                      child: const Text(
                        "Today",
                        style: TextStyle(
                          color: orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.entries.map((MapEntry<String, int> entry) {
                        String key = entry.key;
                        int value = entry.value;
                        return Container(
                          width: MediaQuery.of(context).size.width - 70,
                          height: 90,
                          margin: const EdgeInsets.only(left: 30, bottom: 20),
                          decoration: BoxDecoration(
                            color: accentGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  key,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '$value Terms',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
