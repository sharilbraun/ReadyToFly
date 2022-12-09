// Class used to create a widget that plays an audio file.
// Pulls the audio from a URL.
// The play bool, player, and cache are static so they can be accessed from
// other pages (to make sure the audio stops after navigating away).
// There is no indication to the user that the audio is playing. This should
// be fixed in future versions.
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class AudioContent extends StatelessWidget {
  // Address of the content file
  final String link;
  static bool play = false;
  static AudioPlayer player = AudioPlayer();
  static AudioCache cache = AudioCache();

  const AudioContent({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    try {
      return Column(
        children: [
          SizedBox(
            width: 50,
            height: 60,
            child: IconButton(
              onPressed: () {
                if (play == true) {
                  player.stop();
                  player.dispose();
                  play = false;
                }
                player.play(UrlSource(link));
                play = true;
              },
              icon: const Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const Text('Press the button to start and stop the audio.',
              style: TextStyle(color: Colors.white)),
        ],
      );
    } catch (exception) {
      return const Text(
          'Could not retrieve audio content. Please select Contact Us from the menu to report this bug.');
    }
  }
}
