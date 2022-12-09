// Creates a pop up menu when the hamburger icon is pressed.
// Modify, add, delete PopupMenuItems below to change the menu.
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return PopupMenuButton(
          color: Colors.blue.shade100,
          icon: const Icon(Icons.menu, color: Colors.black),
          itemBuilder: (context) {
            return [
              // Navigates to the main menu
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.home_outlined, color: Colors.black),
                    Text(" Home Page"),
                  ],
                ),
              ),
              // Navigates to the Links page
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.link, color: Colors.black),
                    Text(" Useful Links"),
                  ],
                ),
              ),
              // Navigates to the About Us page
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.info_outline, color: Colors.black),
                    Text(" About Us"),
                  ],
                ),
              ),
              // Navigates to the Contact page
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.feedback_outlined, color: Colors.black),
                    Text(" Contact Us"),
                  ],
                ),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
              Navigator.of(context).popUntil(ModalRoute.withName('/home'));
            } else if (value == 1) {
              Navigator.pushNamed(context, '/links');
            } else if (value == 2) {
              Navigator.pushNamed(context, '/about');
            } else if (value == 3) {
              Navigator.pushNamed(context, '/contact');
            }
          });
    } catch (exception) {
      return const Text(
          'Could not set up side menu. Please email readytoflycanada@gmail.com to report this bug.');
    }
  }
}
