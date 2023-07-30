import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../code_bot/code_bot_page.dart';
import '../code_converter/code_converter_page.dart';
import '../code_hint_provider/code_hint_provider_page.dart';
import '../code_solver/code_solver_page.dart';


class NavigationLayout extends StatefulWidget {
  const NavigationLayout({Key? key}) : super(key: key);

  @override
  NavigationLayoutState createState() => NavigationLayoutState();
}

class NavigationLayoutState extends State<NavigationLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabNavigations =[
      const CodeSolverPage(),
      CodeHintProviderPage(),
      CodeConverterPage(),
      const ChatPage(),
    ];
    return Scaffold(

      body: tabNavigations[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: const Color(0xFF83BD75),
            labelTextStyle: MaterialStateProperty.all(
              GoogleFonts.montserrat(
                fontSize: 12,
              ),
            )),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // backgroundColor: const Color.fromARGB(255, 215, 225, 209),
          backgroundColor: const Color(0xFFE9EFC0),
          destinations:  const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.bug, size: 20),
              label: "Debug",
            ),

            // NavigationDestination(icon: Icon(Icons.create, size: 20), label: 'Combo Buy'),
            NavigationDestination(icon: FaIcon(FontAwesomeIcons.info, size: 20), label: 'Get Hint'),
            NavigationDestination(icon: Icon(FontAwesomeIcons.code, size: 20), label: 'Convert'),
            NavigationDestination(icon: Icon(FontAwesomeIcons.rocketchat, size: 20), label: 'Code Bot'),
          ]
        ),
      ),
    );
  }
}
