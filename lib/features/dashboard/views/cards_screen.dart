import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vis_can_learn/features/dashboard/views/full_card_view.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class CardsScreen extends StatefulWidget {
  final String setId;
  final String title;

  const CardsScreen({super.key, required this.setId, required this.title});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  initState() {
    super.initState();
    getData(widget.setId);
  }

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

  Map<String, String> data = {};

  String description = "";

  Future<void> getData(String setId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionRef =
        firestore.collection('sets');
    print(collectionRef);
    print(setId);
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionRef.where('set_id', isEqualTo: setId).get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> setData = querySnapshot.docs.first.data();
      List<dynamic> setArray = setData['set_array'];
      setState(() {
        data.clear();
        for (var i = 0; i < setArray.length; i++) {
          data[setArray[i]['term']] = setArray[i]['definition'];
        }
        description = setData['set_description'];
      });
    } else {
      throw Exception("No such document.");
    }
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              widget.title,
                              style: const TextStyle(
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  //addVerticalSpace(25),
                  Expanded(
                    child: SingleChildScrollView(
                      child: 
                        Column(
                          children: [
                            Padding(
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
                                        return Stack(
                                          // Use Stack to overlay the icon on top of the card
                                          children: [
                                            Container(
                                              width: 300,
                                              margin: const EdgeInsets.only(
                                                  right: 20),
                                              decoration: BoxDecoration(
                                                color: accentGreen,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      key,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    addVerticalSpace(10),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Positioned(
                                            //   // Position the icon at the bottom right corner
                                            //   left: 240,
                                            //   bottom: 10,
                                            //   right: 10,
                                            //   child: IconButton(
                                            //     icon: const Icon(Icons.fullscreen),
                                            //     color: Colors.white,
                                            //     onPressed: () {
                                            //       goToCardFull();
                                            //     },
                                            //   ),
                                            // ),
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            addVerticalSpace(30),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          description,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      const Text(
                                        '  | ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${data.length} terms",
                                        style:
                                            const TextStyle(color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  addVerticalSpace(30),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add button onPressed logic here
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
                                        children: [
                                          Image.asset(
                                            'assets/images/exam.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          addHorizontalSpace(20),
                                          const Text(
                                            'Test',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  addVerticalSpace(30),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cards',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Icon(Icons.sort, color: Colors.white),
                                    ],
                                  ),
                                  addVerticalSpace(20),
                                  SizedBox(
                                    height: data.length * 120.0,
                                    child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        String key = data.keys.elementAt(index);
                                        String value =
                                            data.values.elementAt(index);
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            color:
                                                accentGreen, // Change this to your desired color
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              key,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            subtitle: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            tileColor: accentGreen,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
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
    );
  }
}
