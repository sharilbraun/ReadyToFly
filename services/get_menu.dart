// Pulls the json file containing submenu information from the assets/json
// folder. Creates Menu Button objects from the json data, adds them to a list,
// sends the list of Menu Buttons to menu_page.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/widgets/menu_button.dart';

class GetMenu extends StatefulWidget {
  const GetMenu({super.key});

  @override
  State<StatefulWidget> createState() => _GetMenuState();
}

class _GetMenuState extends State<GetMenu> {
  Map data = {};
  late String pageName;
  late String fileLocation;

  @override
  void initState() {
    super.initState();
  }

  void setUpMenu() async {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      pageName = data['pageName'];
      String urlPageName = pageName.replaceAll(' ', '_');
      fileLocation = 'assets/json/$urlPageName.json';
      var jsonText = await rootBundle.loadString(fileLocation);
      List menuMap = jsonDecode(jsonText);
      List<MenuButton> buttons =
          menuMap.map((menuJson) => MenuButton.fromJson(menuJson)).toList();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/menu',
          arguments: {'pageName': pageName, 'buttons': buttons});
    } catch (exception) {
      const Text(
          'Could not set up menu. Please select Contact Us from the menu to report this bug.');
    }
  }

  // Shows a spinkit widget while menu is being created
  @override
  Widget build(BuildContext context) {
    try {
      setUpMenu();
      return Scaffold(
          backgroundColor: Colors.blue[100],
          body: const Center(
              child: SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          )));
    } catch (exception) {
      return const Text(
          'Could not retrieve loading image. Please select Contact Us from the menu to report this bug.');
    }
  }
}
