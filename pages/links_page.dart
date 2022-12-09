// This page displays a list of outside links the user may find useful.
// To add links, add Link objects with the required parameters to the links List.
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/side_menu.dart';
import 'package:url_launcher/link.dart';

class LinksPage extends StatelessWidget {
  // List of Link objects - this could be refactored to reference a link model
  // which takes parameters and builds the object
  final List<Link> links = [
    Link(
      uri: Uri.parse('https://www.navcanada.ca/en/vfr-phraseology.pdf'),
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: followLink,
        child: const Text(
          'VFR Phraseology', // Displayed on link button
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
      ),
    ),
    Link(
      uri: Uri.parse(
          'https://www.ic.gc.ca/eic/site/smt-gst.nsf/eng/sf01397.html'),
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: followLink,
        child: const Text(
          'Radio Study Guide',
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
      ),
    ),
    Link(
      uri: Uri.parse(
          'https://tc.canada.ca/en/aviation/general-operating-flight-rules/aviation-safety-poster-gallery'),
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: followLink,
        child: const Text(
          'TC Safety Posters',
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
      ),
    ),
    Link(
      uri: Uri.parse('https://www.youtube.com/user/AirSafetyInstitute/videos'),
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: followLink,
        child: const Text(
          'Aviation Videos',
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
      ),
    ),
    Link(
      uri: Uri.parse(
          'https://tc.canada.ca/en/aviation/publications/student-pilot-permit-private-pilot-licence-foreign-military-applicants-aviation-regulations-tp-11919'),
      builder: (BuildContext context, Future<void> Function()? followLink) =>
          ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: followLink,
        child: const Text(
          'TC Pilot Requirements',
          style: TextStyle(fontSize: 20, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
      ),
    ),
  ];

  LinksPage({super.key});

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
              'Useful Links',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade100,
          ),
          body: Stack(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            )),
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: links.length,
                itemBuilder: (BuildContext context, int index) {
                  return links[index];
                })
          ]));
    } catch (exception) {
      return const Text(
          'Could not retrieve Links. Please select Contact Us from the menu to report this bug.');
    }
  }
}
