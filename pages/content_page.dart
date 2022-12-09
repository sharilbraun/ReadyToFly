// This class is used to display the content.
// It is called by the get_content page which provides the Content list - saved
// as contentWidgets.
// The contentWidgets list is traversed and each widget added to the page.
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/side_menu.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContentState();
}

class _ContentState extends State<ContentPage> {
  Map data = {};
  late String pageName;
  List<Widget> contentWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Makes sure there is no background audio playing.
    if (AudioContent.play == true) {
      AudioContent.player.stop();
      AudioContent.player.dispose();
      AudioContent.play = false;
    }
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      pageName = data['pageName'];
      contentWidgets = data['contentWidgets'];
      // Stops audio content from playing when user hits the back button
      return WillPopScope(
        onWillPop: () async {
          if (AudioContent.play == true) {
            AudioContent.player.stop();
            AudioContent.player.dispose();
            AudioContent.play = false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            actions: const [SideMenu()],
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: Text(
              pageName,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade100,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Adds Content widgets with padding at the top
            // ListView provides scrollable page
            child: ListView(children: <Widget>[
              for (Widget content in contentWidgets)
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: content),
            ]),
          ),
        ),
      );
    } catch (exception) {
      return const Text(
          'Cannot display content. Please select Contact Us from the menu to report this bug.');
    }
  }
}
