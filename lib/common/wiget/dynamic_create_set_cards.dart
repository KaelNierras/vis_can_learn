// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vis_can_learn/common/wiget/Input_text_secondary.dart';
import 'package:vis_can_learn/utils/widget_helper.dart';

class MyCard extends StatefulWidget {
  final Function addCardCallback;
  final List<String> items;
  final List<TextEditingController> frontSideControllers;
  final List<TextEditingController> definitionControllers;

  const MyCard({
    super.key,
    required this.addCardCallback,
    required this.items,
    required this.frontSideControllers,
    required this.definitionControllers,
  });

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  void addCard() {
    widget.addCardCallback();
  }

  void deleteCard(int index) {
    setState(() {
      widget.items.removeAt(index);
      widget.frontSideControllers.removeAt(index);
      widget.definitionControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: Key(index.toString()),
                endActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) => deleteCard(index),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTextSecondary(
                              text: '',
                              controller: widget.frontSideControllers[index]),
                          const Text(
                            'TERM (FRONT SIDE)',
                            style: TextStyle(color: Colors.white),
                          ),
                            addVerticalSpace(20),
                          InputTextSecondary(
                              text: '',
                              controller: widget.definitionControllers[index]),
                              const Text(
                            'DEFINATION (BACK SIDE)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        addVerticalSpace(30),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              addCard();
            },
            child: const Text('ADD ANOTHER CARD'),
          ),
        ),
      ],
    );
  }
}
