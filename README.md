# Ready to Fly

Ready to Fly is a native mobile reference application. Its purpose is to provide pilots with an easy way to access information related to flying procedures.

## File Structure

The files and folders that were created for the application are:

assets - folder containing asset files used for the application
    icon - folder containing the icon asset file
        icon.png - image of the application icon
    json - folder containing the json asset files
        json files - contain the menu options for each submenu
    background.jpg - the background image for most application pages
lib - folder containing programming files for the application
    models - folder containing classes implemented in the application
    pages - folder containing the pages - includes layout and widget information
    services - folder containing services - retrieves content and menu for pages, handler for app suspension events
    widgets - folder containing widgets - one for each content type plus the side menu and menu button widgets
    main.dart - main application file
    README.md - readme file for the application

## Usage

### Change the Application Icon

Upload a new png file called icon.png to the icon folder in the assets folder.

### Change the Application Background Image

Upload a new jpg file called background.jpg to the assets folder.

### Change the Options on a Submenu

1. Locate the applicable json file in the assets/json folder.
2. Modify the optionName and optionType fields, as required.
3. Save the file.

### Add Content to a Menu Option

1. Open lib/services/get_content.dart
2. In the Map contentList, find the subject you wish to add content to.
3. Add a new Content instance to the List using the format:
    `Content(link: 'http://sharibee.com/appAssets/Weather.JPG', type: 'image', name: 'Weather Minima')`
4. Type options include image, video (YouTube video), link (hyperlink), or audio.
5. The name must be included but is only used for links. It is the text displayed instead of the actual link.
6. Save the file.

### Remove Content from a Menu Option

1. As with adding content, open get_content.dart and find the subject.
2. Delete the Content instance from the list.
3. Save the file.

### Uploading a New Version to Google Play

1. Open pubspec.yaml.
2. Change the version number. (ex: `version: 1.0.0+5` to `version: 1.0.0+6` for a new release of version 1.0.0)
3. From the application folder in the terminal, run `flutter build appbundle`
4. Upload the app bundle to Google Play Console from {appfolder}/build/app/outputs/bundle/release/app-release.aab.
5. Follow the instructions on the Google Play Console.

## Packages Used in this Application

- audioplayers
- youtube_player_iframe
- url_launcher
- flutter_spinkit

## Development Environment Used

Developed in Visual Studio Code using Flutter and Android Studio. 

## Outstanding Issues and Opportunities for Improvement

When an audio file plays, there is no change in the icon or indication that the audio is playing. This is because the audio_content widget is stateless. This could be changed to stateful to allow for icon changes. The content_page may then have to be modified to allow stateful widgets, however.

Additionally, the YouTube videos result in a lot of functions being executed and may slow down the application. This is likely due to the package being used and the high volume of data but perhaps the package will be improved in the future.
