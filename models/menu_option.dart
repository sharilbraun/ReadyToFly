// This class is used by get_menu to create objects that are then used to create
// menu_button objects.

class MenuOption {
  // Text that will be displayed on the menu button and used to find the content
  // or submenu
  String optionName;
  // Either menu or content - determines which page is called when button clicked
  String optionType;

  MenuOption({required this.optionName, required this.optionType});
}
