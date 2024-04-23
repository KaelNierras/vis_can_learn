// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:vis_can_learn/features/dashboard/views/dashboard_screen.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';
import 'package:vis_can_learn/common/wiget/input_text_secondary.dart';
import 'package:vis_can_learn/common/wiget/dynamic_create_set_cards.dart';

class CreateSet extends StatefulWidget {
  const CreateSet({super.key});

  @override
  State<CreateSet> createState() => _CreateSetState();
}

class _CreateSetState extends State<CreateSet> {
  TextEditingController setText = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController course = TextEditingController();

  List<String> items = ['Item 1'];
  List<TextEditingController> frontSideControllers = [];
  List<TextEditingController> definitionControllers = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < items.length; i++) {
      frontSideControllers.add(TextEditingController());
      definitionControllers.add(TextEditingController());
    }
  }

  void addCard() {
    setState(() {
      items.add('New Item');
      frontSideControllers.add(TextEditingController());
      definitionControllers.add(TextEditingController());
    });
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            goToDashboard();
          },
        ),
        title: const Text(
          'Create Set',
          style:
              TextStyle(color: Colors.white), // Set the color of the title text
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            color: Colors.white,
            onPressed: () {
              // Add check button functionality here
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, // Set the width to 100%
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputTextSecondary(
                  text: 'Subject, chapter, unit', controller: setText),
              const Text(
                'SET NAME',
                style: TextStyle(color: Colors.white),
              ),
              addVerticalSpace(20),
              InputTextSecondary(text: '', controller: description),
              const Text(
                'DESCRIPTION (OPTIONAL)',
                style: TextStyle(color: Colors.white),
              ),
              addVerticalSpace(20),
              InputTextSecondary(text: '', controller: course),
              const Text(
                'COURSE',
                style: TextStyle(color: Colors.white),
              ),
              addVerticalSpace(50),
              Expanded(
                child: MyCard(
                  addCardCallback: addCard,
                  items: items,
                  frontSideControllers: frontSideControllers,
                  definitionControllers: definitionControllers,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
