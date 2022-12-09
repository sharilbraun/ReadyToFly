// This file produces a simple page containing text widgets with information
// about the application and developer.
// To modify the information on the About Us page, edit the text below.

import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/side_menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Makes sure there is no background audio still playing
    if (AudioContent.play == true) {
      AudioContent.player.stop();
      AudioContent.player.dispose();
      AudioContent.play = false;
    }
    try {
      return Scaffold(
          backgroundColor: Colors.blue.shade100,
          appBar: AppBar(
            actions: const [SideMenu()],
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: const Text(
              'About Us',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade100,
          ),
          body: ListView(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            )),
            // Describes project, motivation
            Container(
              color: Colors.blue.shade100,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'This application was built for a degree project while the creator was studying at Athabasca University. The goal of the application is to help pilots recall procedures they are uncertain about. The app developer is a former commercial pilot and flight instructor. She came up with the idea for the app when thinking about how her confidence decreased when she had not been flying in awhile. The goal of the developer is to help pilots have more confidence and be safer pilots.',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            // Lists sources of content
            Container(
              color: Colors.blue.shade100,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'Content sources include: Transport Canada resources, Industry Canada radio operator study materials and scripts, From the Ground Up 29th edition, Canadian Flight Centre YouTube channel, Humble Aviation YouTube channel, Free Pilot Training YouTube channel, The CFI YouTube channel, AeroGuard Flight Training Center YouTube channel, Aviator Zone YouTube channel, SmartPilotCanada YouTube channel, Fly With The Guys YouTube channel, Aviation English Academy YouTube channel, Thrust Flight Academy YouTube channel, Air Safety Institute YouTube channel, Edmonton Flying Club CFI YouTube channel, Josh Matthews YouTube channel, FlightInsight YouTube channel, 310 Pilot YouTube channel, ERAU SpecialVFR YouTube channel, AIDYL CONCEPTS YouTube channel, and Epic Flight Academy YouTube channel, .',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            // Thank you section
            Container(
              color: Colors.blue.shade100,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'A very special thank you to Justin at Divergent Sounds for recording, mixing, and mastering the radio examples and to Avery for being there.',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
          ]));
    } catch (exception) {
      return const Text(
          'Could not retrieve About page. Please select Contact Us from the menu to report this bug.');
    }
  }
}
