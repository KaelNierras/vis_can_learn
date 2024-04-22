import 'package:flutter/material.dart';
import 'package:vis_can_learn/theme/custom_colors.dart';
import 'package:vis_can_learn/utils/size_config.dart';

class CreateSet extends StatelessWidget {
  const CreateSet({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: background, // Set the app bar background color
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              // Add back button functionality here
            },
          ),
          title: const Text(
            'Create Set',
            style: TextStyle(color: Colors.white), // Set the color of the title text
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
          color: darkGreen, // Set the lower panel background color
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Subject, chapter, unit',
                    hintStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set the border color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set the border color
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'SET NAME',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10), // Adding some spacing between the two input lines
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set the border color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set the border color
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'DESCRIPTION (OPTIONAL)',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 50),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'TERM (FRONT SIDE)',
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(height: 10),

                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Set the border color
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Set the border color
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(height: 5),
                      Text(
                        'DEFINITION (BACK SIDE)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: orange, // Use the orange color from theme.dart
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("ADD ANOTHER CARD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
