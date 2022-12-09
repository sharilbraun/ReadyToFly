// Page that is displayed when the app is first opened.
// Cannot navigate back to this page after accepting terms.
// To change the disclaimer text, modify the Text widgets below.
import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
          backgroundColor: Colors.blue.shade100,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: const Text(
              'Ready to Fly',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade100,
          ),
          body: Center(
              child: ListView(children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(style: TextStyle(fontSize: 20), 'Disclaimer'),
              ),
            ),
            // Discusses user responsibility
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  style: TextStyle(fontSize: 16),
                  'Thank you for downloading the Ready to Fly app. This app is meant to help you recall basic flying procedures. We recommend contacting your local flight school or talking to your flight instructor about any procedures you are unsure of. The content in this app has been taken from various sources. Whenever possible, we have included references to official Transport Canada documentation. By using this app, you understand that this app may contain faulty information and it is your responsiblity to verify any information by consulting the Transport Canada regulations, your aircraft operating handbook, or other official documentation.'),
            ),
            // Request for submission of correct information, technical issues
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  style: TextStyle(fontSize: 16),
                  'If you find any incorrect information or experience technical issues with this app, please contact us via the Contact Us page or by emailing readytoflycanada@gmail.com.'),
            ),
            // Usage of the app
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  style: TextStyle(fontSize: 16),
                  'To use this app, simply select your desired content from each menu by clicking on the button for that content. There may be a series of menu options to reach the desired content. Use the back button to go to the last page or select Home from the main menu.'),
            ),
            // Agreement condition
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  style: TextStyle(fontSize: 16),
                  'To agree with the conditions of use and continue to the app, please click the button below.'),
            ),
            // Change the Navigator function to allow users to click back to this page
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                child: const Text('Accept and Continue')),
          ])));
    } catch (exception) {
      return const Text(
          'Unable to load disclaimer. Please restart the app and report this bug to readytoflycanada@gmail.com.');
    }
  }
}
