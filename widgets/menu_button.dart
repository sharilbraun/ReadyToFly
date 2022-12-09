// Creates Menu Button objects from json data.
// If the button type is content, onPressed navigates to getContent.
// If the button type is menu, onPressed navigates to getMenu.
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuButton extends StatelessWidget {
  String optionName; // Text on the button
  String optionType; // Must be Menu or Content only

  MenuButton({required this.optionName, required this.optionType, super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return ElevatedButton(
          onPressed: () {
            if (optionType == 'menu') {
              Navigator.pushNamed(context, '/getMenu',
                  arguments: {'pageName': optionName});
            } else {
              Navigator.pushNamed(context, '/getContent',
                  arguments: {'pageName': optionName});
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            backgroundColor: Colors.blue.shade100,
          ),
          child: Text(
            optionName,
            style: const TextStyle(fontSize: 25, color: Colors.black),
            overflow: TextOverflow.clip,
          ));
    } catch (exception) {
      return const Text(
          'Could not create menu button. Please select Contact Us from the menu to report this bug.');
    }
  }

  factory MenuButton.fromJson(dynamic json) {
    return MenuButton(
        optionName: json['optionName'] as String,
        optionType: json['optionType'] as String);
  }
}
