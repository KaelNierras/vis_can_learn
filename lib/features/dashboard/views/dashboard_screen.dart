import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/authentication/views/login_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/create_set.dart';
import 'package:vis_can_learn/features/dashboard/views/library_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/search_screen.dart';
import 'package:vis_can_learn/features/dashboard/views/cards_screen.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';
import 'package:vis_can_learn/features/dashboard/models/set_model.dart';
import 'package:vis_can_learn/features/dashboard/controllers/dashboard_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  void initState() {
    super.initState();
    fetchUserId();
    fetchReviewers();
  }

    

  Map<String, dynamic> data = {};
  String currentUser = '' ;
  

  void goToCreateSet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateSet(),
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

  void goToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Login()),
      (Route<dynamic> route) => false,
    );
  }


  void fetchUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUser = user.uid;
      });
    } else {
    }
  }

  void goToLibrary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LibraryScreen(),
      ),
    );
  }

  void goToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      ),
    );
  }

  void goToCardScreen(String setId, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardsScreen(setId: setId, title: title,),
      ),
    );
  }

  void fetchReviewers() async {
    List<Sets> reviewers = await getReviewers(currentUser);
    setState(() {
      data = {for (var reviewer in reviewers) reviewer.name: {'count': reviewer.count, 'id': reviewer.id}};
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
                width: MediaQuery.of(context).size.width, // Set the width to 100%
                decoration: BoxDecoration(
                  gradient: gradientAppbar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/VisCanLearnLogo.png',
                          width: 175,
                        ),
                        PopupMenuButton<int>(
                          offset: const Offset(0, 50),
                          icon: const Icon(
                            Icons.people,
                            size: 30,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 1,
                              child: Text("Change Name"),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: const Text("Signout"),
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                goToLogin();
                              },
                            ),
                          ],
                          onSelected: (value) {
                            // handle your logic here based on selected value
                          },
                        )
                      ],
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: goToSearch,
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(lightGreen),
                                side: WidgetStateProperty.all(const BorderSide(
                                    color: Colors.white, width: 2)),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), // Set the border radius here
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
                                            Color.fromARGB(244, 218, 218, 218)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(25),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sets',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle your tap event here
                              //print('View All clicked');
                              goToLibrary();
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                color: orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      addVerticalSpace(20),
                      SizedBox(
                        height: 125,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            String key = data.keys.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                // Handle your tap event here
                                //print('Card $key clicked');
                                goToCardScreen(data[key]['id'],key.toString());
          
                              },
                              child: Container(
                                width: 250,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: accentGreen,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          },
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
                      onTap: () {
                        goToLibrary();
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
