// ignore_for_file: await_only_futures
// This service finds the text associated with the content type menu button in
// the contentList map. It then creates widgets for each content instance in
// the list of applicable contents, depending on the type of content. The list
// of content Widgets are then sent to the content_page to be displayed for the
// user.
// To add, remove, or otherwise modify content, edit the contentList below.
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/models/content.dart';
import 'package:myapp/widgets/audio_content.dart';
import 'package:myapp/widgets/image_content.dart';
import 'package:myapp/widgets/link_content.dart';
import 'package:myapp/widgets/video_content.dart';

class GetContent extends StatefulWidget {
  const GetContent({super.key});

  @override
  State<StatefulWidget> createState() => _GetContentState();
}

class _GetContentState extends State<GetContent> {
  // Map and list of content for each menu option
  static Map<String, List<Content>> contentList = {
    'Weather Minima': [
      Content(
          link: 'http://sharibee.com/appAssets/Weather.JPG',
          type: 'image',
          name: 'Weather Minima')
    ],
    'Cold Weather': [
      Content(link: 'dqJ-t37aHb4', type: 'video', name: 'Cold Weather')
    ],
    'Mountain Flying': [
      Content(link: '6b7OE_atvA4', type: 'video', name: 'Mountain Flying')
    ],
    'Thunderstorms': [
      Content(link: 'ro8VUHXyp_Y', type: 'video', name: 'Thunderstorms')
    ],
    'Cloud Types': [
      Content(
          link: 'http://sharibee.com/appAssets/Cloud_types_en.png',
          type: 'image',
          name: 'Cloud Types')
    ],
    'PIREP': [
      Content(
          link: 'http://sharibee.com/appAssets/PIREP.mp3',
          type: 'audio',
          name: 'PIREP'),
      Content(link: 'QXQK847T2hU', type: 'video', name: 'PIREP'),
      Content(
          link: 'http://sharibee.com/appAssets/PIREPScript.JPG',
          type: 'image',
          name: 'PIREP')
    ],
    'ADF': [Content(link: '_TZ3EjSYWfY', type: 'video', name: 'ADF')],
    'VOR': [Content(link: 'iCCk2ch-xL4', type: 'video', name: 'VOR')],
    'GPS': [Content(link: 'yh73ip84M4I?t=253', type: 'video', name: 'GPS')],
    'Navigation Calculations': [
      Content(link: 'QGcgaRu3vs4', type: 'video', name: 'Nav Calculations')
    ],
    'Fuel Requirements': [
      Content(
          link: 'http://sharibee.com/appAssets/Fuel.JPG',
          type: 'image',
          name: 'Fuel Requirements')
    ],
    'Slide Rule Calculations': [
      Content(link: 'zPUKCzg8bdU', type: 'video', name: 'Slide Rule')
    ],
    'Transponder Codes': [
      Content(
          link: 'http://sharibee.com/appAssets/Transponder.JPG',
          type: 'image',
          name: 'Transponder Codes')
    ],
    'ELT Use': [Content(link: 'irOueBtHtMc', type: 'video', name: 'ELT Use')],
    'Carburetor Ice': [
      Content(link: 'BJJZ7JTOkAU', type: 'video', name: 'Carburetor Ice')
    ],
    'Airframe Ice': [
      Content(link: 'OJ12pqP3FjI', type: 'video', name: 'Airframe Ice'),
      Content(
          link: 'http://sharibee.com/appAssets/Deice.jpg',
          type: 'image',
          name: 'Airframe Ice')
    ],
    'Spin on Final': [
      Content(link: 'ZI9T5m2eRJo', type: 'video', name: 'Spin on Final')
    ],
    'Spin Recovery': [
      Content(link: 'u4LAib--3DU', type: 'video', name: 'Spin Recovery')
    ],
    'Spiral Dive Recovery': [
      Content(link: 'VN372vHt19A', type: 'video', name: 'Spiral Dive')
    ],
    'Fire': [Content(link: 'fyZn8TL-F5g', type: 'video', name: 'Fire')],
    'Engine Failure': [
      Content(link: 'qbzIFD6YW8Q', type: 'video', name: 'Engine Failure')
    ],
    'Forced Approach': [
      Content(link: 'IE31bpwJRek', type: 'video', name: 'Forced Approach')
    ],
    'Precautionary Approach': [
      Content(link: 'EH21Eo8MEqc', type: 'video', name: 'Precautionary')
    ],
    'Controlled Departure': [
      Content(link: 'xuvtYzwznhE', type: 'video', name: 'Controlled Departure'),
      Content(
          link: 'http://sharibee.com/appAssets/tc_6010_airspaceposter_e.jpg',
          type: 'image',
          name: 'Controlled Departure')
    ],
    'NORDO': [Content(link: 'VEHZkEoIFIk', type: 'video', name: 'NORDO')],
    'Aerodrome Light Signals': [
      Content(link: 'HQHo4qvnQR4', type: 'video', name: 'Light Signals'),
      Content(
          link: 'http://sharibee.com/appAssets/tp13867e.jpg',
          type: 'image',
          name: 'Aerodrom Light')
    ],
    'ATF Departure': [
      Content(link: 'W0DUGTLSH6o', type: 'video', name: 'ATF Departure'),
      Content(
          link:
              'http://sharibee.com/appAssets/tp11541e_accessible_vfr_procedures_at_uncontrolled_aerodromes_en.jpg',
          type: 'image',
          name: 'ATF Departure')
    ],
    'MF Departure': [
      Content(link: 'YVCyFKtEHlo', type: 'video', name: 'MF Departure'),
      Content(
          link:
              'http://sharibee.com/appAssets/tp11541e_accessible_vfr_procedures_at_uncontrolled_aerodromes_en.jpg',
          type: 'image',
          name: 'MF Departure')
    ],
    'ARCAL': [Content(link: 'FSl8iIpeHEk', type: 'video', name: 'ARCAL')],
    'Wake Turbulence': [
      Content(
          link: 'http://sharibee.com/appAssets/WakeTurbulence.JPG',
          type: 'image',
          name: 'Wake Turbulence')
    ],
    'Controlled Arrival': [
      Content(link: 'uodwfhfXnAM', type: 'video', name: 'Controlled Arrival'),
      Content(
          link: 'http://sharibee.com/appAssets/tc_6010_airspaceposter_e.jpg',
          type: 'image',
          name: 'Controlled Arrival')
    ],
    'Holding': [
      Content(link: 'G2CAOH6RjBg', type: 'video', name: 'Holding'),
      Content(
          link: 'http://sharibee.com/appAssets/VFRHold.JPG',
          type: 'image',
          name: 'Holding')
    ],
    'ATF Arrival': [
      Content(link: 'MtT7a-JC2Ok', type: 'video', name: 'ATF Arrival'),
      Content(
          link:
              'http://sharibee.com/appAssets/tp11541e_accessible_vfr_procedures_at_uncontrolled_aerodromes_en.jpg',
          type: 'image',
          name: 'ATF Arrival')
    ],
    'MF Arrival': [
      Content(link: 'jku83rLM1bM', type: 'video', name: 'MF Arrival'),
      Content(
          link:
              'http://sharibee.com/appAssets/tp11541e_accessible_vfr_procedures_at_uncontrolled_aerodromes_en.jpg',
          type: 'image',
          name: 'MF Arrival')
    ],
    'Class F Airspace': [
      Content(
          link: 'http://sharibee.com/appAssets/ClassF.JPG',
          type: 'image',
          name: 'Class F Airspace')
    ],
    'Collision Avoidance': [
      Content(link: 'XFDhav4gs7o', type: 'video', name: 'Collision Avoidance')
    ],
    'Controlled Departure Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/Controlled_Departure.mp3',
          type: 'audio',
          name: 'Controlled Departure Calls'),
      Content(
          link:
              'http://sharibee.com/appAssets/ControlledDepartureScript_Page_1.jpg',
          type: 'image',
          name: 'Controlled Departure Calls'),
      Content(
          link:
              'http://sharibee.com/appAssets/ControlledDepartureScript_Page_2.jpg',
          type: 'image',
          name: 'Controlled Departure Calls'),
    ],
    'ATF Departure Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/ATF_Departure.mp3',
          type: 'audio',
          name: 'ATF Departure Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/ATFDepartureScript.JPG',
          type: 'image',
          name: 'ATF Departure Calls')
    ],
    'MF Departure Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/MF_Departure.mp3',
          type: 'audio',
          name: 'MF Departure Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/MFDepartureScript_Page_1.jpg',
          type: 'image',
          name: 'MF Departure Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/MFDepartureScript_Page_2.jpg',
          type: 'image',
          name: 'MF Departure Calls'),
    ],
    'Controlled Arrival Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/Controlled_Arrival.mp3',
          type: 'audio',
          name: 'Controlled Arrival Calls'),
      Content(
          link:
              'http://sharibee.com/appAssets/ControlledArrivalScript_Page_1.jpg',
          type: 'image',
          name: 'Controlled Arrival Calls'),
      Content(
          link:
              'http://sharibee.com/appAssets/ControlledArrivalScript_Page_2.jpg',
          type: 'image',
          name: 'Controlled Arrival Calls'),
      Content(
          link:
              'http://sharibee.com/appAssets/ControlledArrivalScript_Page_3.jpg',
          type: 'image',
          name: 'Controlled Arrival Calls'),
    ],
    'ATF Arrival Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/ATF_Arrival.mp3',
          type: 'audio',
          name: 'ATF Arrival Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/ATFArrivalScript.JPG',
          type: 'image',
          name: 'ATF Arrival Calls')
    ],
    'MF Arrival Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/MF_Radio_Arrival.mp3',
          type: 'audio',
          name: 'MF Arrival Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/MFArrivalScript_Page_1.jpg',
          type: 'image',
          name: 'MF Arrival Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/MFArrivalScript_Page_2.jpg',
          type: 'image',
          name: 'MF Arrival Calls'),
    ],
    'Phonetic Alphabet': [
      Content(
          link: 'http://sharibee.com/appAssets/PhoneticAlphabet.JPG',
          type: 'image',
          name: 'Phonetic Alphabet')
    ],
    'Radio Operation': [
      Content(
          link: 'https://www.navcanada.ca/en/vfr-phraseology.pdf',
          type: 'link',
          name: 'VFR Phraseology'),
      Content(
          link: 'https://www.ic.gc.ca/eic/site/smt-gst.nsf/eng/sf01397.html',
          type: 'link',
          name: 'Radio Certificate Study Guide')
    ],
    'VFR Read Back': [
      Content(
          link: 'http://sharibee.com/appAssets/ReadBack.JPG',
          type: 'image',
          name: 'VFR Read Back')
    ],
    'Emergency Calls': [
      Content(
          link: 'http://sharibee.com/appAssets/Emergency_and_Urgency.mp3',
          type: 'audio',
          name: 'Emergency Calls'),
      Content(
          link: 'http://sharibee.com/appAssets/EmergencyScript.JPG',
          type: 'image',
          name: 'Emergency Calls')
    ],
    'Human Factors': [
      Content(
          link: 'http://sharibee.com/appAssets/ImSafe.JPG',
          type: 'image',
          name: 'Human Factors')
    ],
  };
  Map data = {};
  late String pageName;
  late List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
  }

  void setUpContent() async {
    try {
      widgetList = [];
      data = ModalRoute.of(context)!.settings.arguments as Map;
      pageName = data['pageName'];
      List<Content>? contents = contentList[pageName];
      Widget newWidget;
      // Adds content widget to the list to go to content_page
      for (Content contentInstance in contents!) {
        if (contentInstance.type == 'video') {
          newWidget = await VideoContent(link: contentInstance.link);
        } else if (contentInstance.type == 'image') {
          newWidget = await ImageContent(link: contentInstance.link);
        } else if (contentInstance.type == 'audio') {
          newWidget = await AudioContent(link: contentInstance.link);
        } else if (contentInstance.type == 'link') {
          newWidget = await LinkContent(
              link: contentInstance.link, name: contentInstance.name);
        } else {
          newWidget = const Text('Cannot display content');
        }
        widgetList.add(newWidget);
      }
    } catch (exception) {
      widgetList.add(const Text(
          'Could not retrieve content. Please select Contact Us from the menu to report this bug.'));
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/content',
        arguments: {'pageName': pageName, 'contentWidgets': widgetList});
  }

  @override
  Widget build(BuildContext context) {
    try {
      setUpContent();
      return Scaffold(
          backgroundColor: Colors.blue[100],
          body: const Center(
              child: SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          )));
    } catch (exception) {
      return const Text(
          'Could not retrieve loading widget. Please select Contact Us from the menu to report this bug.');
    }
  }
}
