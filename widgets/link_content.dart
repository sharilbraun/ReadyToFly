// Creates and returns a button for a hyperlink.
// The text displayed on the button is stored in the name variable.

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

// ignore: must_be_immutable
class LinkContent extends StatelessWidget {
  String link;
  String name;

  LinkContent({super.key, required this.link, required this.name});

  @override
  Widget build(BuildContext context) {
    try {
      return Link(
        uri: Uri.parse(link),
        builder: (BuildContext context, Future<void> Function()? followLink) =>
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: followLink,
          child: Text(
            name,
            style: const TextStyle(fontSize: 25, color: Colors.black),
            overflow: TextOverflow.clip,
          ),
        ),
      );
    } catch (exception) {
      return const Text(
          'Could not retrieve link content. Please select Contact Us from the menu to report this bug.');
    }
  }
}
