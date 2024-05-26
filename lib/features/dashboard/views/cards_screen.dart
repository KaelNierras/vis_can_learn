import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vis_can_learn/common/wiget/input_text.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
import 'package:vis_can_learn/features/ingame/views/ingame.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';
import 'package:flip_card/flip_card.dart';

class CardsScreen extends StatefulWidget {
  final String setId;
  final String title;
  final String? personId;

  const CardsScreen(
      {super.key, required this.setId, required this.title, this.personId});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  initState() {
    super.initState();
    getData(widget.setId);
  }

  Map<String, String> data = {};

  String description = "";

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content:  Text(message),
        duration: const Duration(milliseconds: 3000),
        width: 280.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 5.0 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void deleteSet() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionRef =
        firestore.collection('sets');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionRef.where('set_id', isEqualTo: widget.setId).get();

    if (querySnapshot.docs.isNotEmpty) {
      String docId = querySnapshot.docs.first.id; // Get the document ID
      await collectionRef
          .doc(docId)
          .delete(); // Delete the document using the document ID
      showSnackBar("Set deleted successfully");
    } else {
      showSnackBar("No such document.");
    }
  }

  void goToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dashboard(),
      ),
    );
  }

  void goToTestMode() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InGame(setId: widget.setId, title: widget.title),
      ),
    );
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
        data.clear();
        for (var i = 0; i < setArray.length; i++) {
          data[setArray[i]['term']] = setArray[i]['definition'];
        }
        description = setData['set_description'];
      });
    } else {
      SnackBar(
        content: const Text("No such document."),
      );
    }
  }

  void removePerson(String personId) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionRef =
        firestore.collection('sets');

    collectionRef
        .where('set_id', isEqualTo: widget.setId)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        doc.reference.update({
          'set_owner': FieldValue.arrayRemove([personId])
        });
        showSnackBar('Person removed successfully');
      } else {
        showSnackBar('No matching document found');
      }
    });
  }

  void addPerson(String personId) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collectionRef =
        firestore.collection('sets');

    collectionRef
        .where('set_id', isEqualTo: widget.setId)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        doc.reference.update({
          'set_owner': FieldValue.arrayUnion([personId])
        });
        showSnackBar('Person added successfully');
      } else {
        showSnackBar('No matching document found');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            goToDashboard();
          },
        ),
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white), // Set the color of the title text
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            offset: const Offset(0, 50),
            icon: const Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 2,
                child: const Text("Manage People"),
                onTap: () async {
                  TextEditingController emailController =
                      TextEditingController();
                  showModalBottomSheet(
                    backgroundColor: background,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 50, left: 30, right: 30, bottom: 20),
                                  child: InputText(
                                    controller: emailController,
                                    name: "Email",
                                    fill: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          addPerson(emailController.text);
                                        },
                                        child: const Text('Add Person'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(green),
                                        ),
                                      ),
                                      addHorizontalSpace(20),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Colors.redAccent),
                                        ),
                                        onPressed: () {
                                          removePerson(emailController.text);
                                        },
                                        child: const Text('Remove Person'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              PopupMenuItem(
                value: 2,
                child: const Text("Delete Set"),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm Deletion'),
                        content: const Text(
                            'Are you sure you want to delete this set?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              deleteSet();
                              goToDashboard();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
            onSelected: (value) {
              // handle your logic here based on selected value
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Column(
                      children: [
                        addVerticalSpace(20),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              String key = data.keys.elementAt(index);
                              String back = data.values.elementAt(index);
                              return FlipCard(
                                direction: FlipDirection.VERTICAL, // default
                                front: Stack(
                                  // Use Stack to overlay the icon on top of the card
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                  ],
                                ),
                                back: Container(
                                  width: 300,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: accentGreen,
                                    borderRadius: BorderRadius.circular(20),
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
                                          back,
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
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                description,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const Text(
                              '  | ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${data.length} terms",
                              style: const TextStyle(color: Colors.white),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          //color: Colors.yellow,
                          height: data.length * 140.0,
                          child: Column(
                            children: data.entries.map((entry) {
                              String key = entry.key;
                              String value = entry.value;
                              return Container(
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color:
                                      accentGreen, // Change this to your desired color
                                  borderRadius: BorderRadius.circular(20),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
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
