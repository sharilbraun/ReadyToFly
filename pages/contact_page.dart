// This page provides a Contact Us button that, when clicked, opens the user's
// email application with the receiving address as readytoflycanada@gmail.com.
// To modify the contact email or subject line, modify the Elevated Button
// elements below
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/side_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContactState();
}

class _ContactState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
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
              'Contact Us',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
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
              // Contains the email elements
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      // Modify this for a different contact email
                      String email =
                          Uri.encodeComponent("readytoflycanada@gmail.com");
                      // Modify this for a different subject line
                      String subject = Uri.encodeComponent("App Feedback");
                      // Modify this for a different default message
                      String body = Uri.encodeComponent("Your feedback.");
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        const Text('Email sent successfully');
                      } else {
                        throw ('Unable to open email application.');
                      }
                    },
                    // Text on the button
                    child: const Text(
                        'Contact Us (opens your email application)')),
              ),
            ],
          ));
    } catch (exception) {
      return const Text(
          'Could not load contact form. Please email readytoflycanada@gmail.com to report this bug.');
    }
  }
}
