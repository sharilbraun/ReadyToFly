// This page displays the main menu and is shown after the Disclaimer page.
// This page is also accessible by selecting Home from the side menu.
// To modify the main menu options, modify the MenuOption list below.
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/menu_button.dart';
import 'package:myapp/models/menu_option.dart';
import 'package:myapp/widgets/side_menu.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  // Main menu options
  MenuOption option1 =
      MenuOption(optionName: 'Flight Planning', optionType: 'menu');
  MenuOption option2 =
      MenuOption(optionName: 'Flight Procedures', optionType: 'menu');
  MenuOption option3 =
      MenuOption(optionName: 'Radio Procedures', optionType: 'menu');
  MenuOption option4 =
      MenuOption(optionName: 'Human Factors', optionType: 'content');

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Checks for and stops background audio
    if (AudioContent.play == true) {
      AudioContent.player.stop();
      AudioContent.player.dispose();
      AudioContent.play = false;
    }
    try {
      return Scaffold(
        appBar: AppBar(
          actions: const [SideMenu()],
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Ready to Fly',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade100,
        ),
        body: Stack(
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            )),
            // Displays the Main Menu options as buttons.
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  MenuButton(
                      optionName: option1.optionName,
                      optionType: option1.optionType),
                  MenuButton(
                      optionName: option2.optionName,
                      optionType: option2.optionType),
                  MenuButton(
                      optionName: option3.optionName,
                      optionType: option3.optionType),
                  MenuButton(
                      optionName: option4.optionName,
                      optionType: option4.optionType),
                ]))
          ],
        ),
      );
    } catch (exception) {
      return const Text(
          'Could not set up Home screen. Please select Contact Us from the menu to report this bug.');
    }
  }
}
