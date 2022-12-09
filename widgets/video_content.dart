// This class takes a YouTube video code and returns a widget that embeds a
// YouTube player in the application and shows the corresponding video.
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoContent extends StatelessWidget {
  final String link;

  const VideoContent({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    try {
      return YoutubePlayerScaffold(
        controller: YoutubePlayerController.fromVideoId(
          videoId: link,
          params: const YoutubePlayerParams(
            mute: false,
            showControls: true,
            showFullscreenButton: true,
          ),
        ),
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return player;
        },
      );
    } catch (exception) {
      return const Text(
          'Could not retrieve video content. Please select Contact Us from the menu to report this bug.');
    }
  }
}
