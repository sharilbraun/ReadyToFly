// This class is used to create Content objects that are then used to access
// the content to be displayed to the user.
// Content objects are created by the get_content file and referenced by
// the content_page file.

class Content {
  // Type can be image, audio, video (for YouTube video), or link
  String type;
  // The location of the file or, for YouTube videos, the video reference number
  String link;
  // Used for links - this is displayed on the button
  String name;

  Content({required this.type, required this.link, required this.name});
}
