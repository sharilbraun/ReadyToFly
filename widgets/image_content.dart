// Retrieves an image file from a URL and returns an Image widget.

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageContent extends StatelessWidget {
  String link;
  late Image imageContent;

  ImageContent({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    try {
      imageContent = Image.network(link);
      return imageContent;
    } catch (exception) {
      return const Text(
          'Could not retrieve image content. Please select Contact Us from the menu to report this bug.');
    }
  }
}
