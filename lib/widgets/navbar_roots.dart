import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/schedule.dart';
import 'package:flutter_application_1/settings.dart';

import '../home.dart';
import '../contact_us.dart';
import '../service.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //Home Screen
    Home(),
    //Schedule Screen
    Schedule(),
     //Messages Screen
    ContactUs(),
    //service
     Service(),
    //Settings Screen
     Settings(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),
            label: "Home",
            ),
             BottomNavigationBarItem(icon: Icon(Icons.calendar_month),
            label: "Schedule",
            ),
             BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_text_fill),
            label: "Contact Us",
            ), 
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_sharp),
            label: "Service",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
