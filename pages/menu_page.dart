// This page displays the menu options from the applicable json file as
// Menu Button objects.
// This page is called by the get_menu page which passes it the List of
// MenuButton objects to be stored in the buttons list.
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/menu_button.dart';
import 'package:myapp/widgets/side_menu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<MenuPage> {
  Map data = {};
  late String pageName;
  List<MenuButton> buttons = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Checks for and stops background audio
    if (AudioContent.play == true) {
      AudioContent.player.stop();
      AudioContent.player.dispose();
      AudioContent.play = false;
    }
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      pageName = data['pageName'];
      buttons = data['buttons'];
      return Scaffold(
        appBar: AppBar(
          actions: const [SideMenu()],
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            pageName,
            style: const TextStyle(
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
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  for (MenuButton button in buttons) button,
                ]))
          ],
        ),
      );
    } catch (exception) {
      return const Text(
          'Could not set up menu page. Please select Contact Us from the menu to report this bug.');
    }
  }
}
