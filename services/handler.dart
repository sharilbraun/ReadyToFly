// The sole purpose of this class is to stop the background audio from playing
// when the application is suspended on the user's device.
// The audio comes from an audio_content object and is part of the content_page.
import 'package:flutter/material.dart';
import 'package:myapp/widgets/audio_content.dart';

class Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      AudioContent.player
          .resume(); // This is not likely to work since the player is always disposed after being stopped
      // If pause and resume functions are desired, use the above, change the stop() call below to
      // pause(), and delete the dispose() function call.
    } else {
      AudioContent.player.stop();
      AudioContent.player.dispose();
    }
  }
}
