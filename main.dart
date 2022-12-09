// Main file for the Ready to Fly native mobile application.
import 'package:flutter/material.dart';
import 'package:myapp/pages/about_page.dart';
import 'package:myapp/pages/contact_page.dart';
import 'package:myapp/pages/content_page.dart';
import 'package:myapp/pages/disclaimer.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/links_page.dart';
import 'package:myapp/pages/menu_page.dart';
import 'package:myapp/services/get_content.dart';
import 'package:myapp/services/get_menu.dart';
import 'package:myapp/services/handler.dart';
import 'package:myapp/widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/disclaimer',
    routes: {
      '/disclaimer': (context) => const Disclaimer(),
      '/home': (context) => Home(),
      '/getMenu': (context) => const GetMenu(),
      '/menu': (context) => const MenuPage(),
      '/getContent': (context) => const GetContent(),
      '/content': (context) => const ContentPage(),
      '/sideMenu': (context) => const SideMenu(),
      '/links': (context) => LinksPage(),
      '/about': (context) => const AboutPage(),
      '/contact': (context) => const ContactPage(),
    },
  ));
  WidgetsBinding.instance.addObserver(Handler());
}
