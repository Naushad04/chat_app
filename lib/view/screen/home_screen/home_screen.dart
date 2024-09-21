import 'package:chat_app/view/screen/people_screen/people_screen.dart';
import 'package:chat_app/view/screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    PeopleScreen(),
    ProfileScreen()
  ];

  // This function is called when the user taps on a bottom navigation item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: _pages[_selectedIndex],
    );
  }

  Widget bottomNavBar() {
    return Container(
      color: Colors.black,
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        useLegacyColorScheme: true,
        // backgroundColor: Colors.black, // Background color of the navigation bar
        selectedItemColor: Colors.black, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ? Colors.blue : Colors.transparent, // Blue bg for selected
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.message, color:  _selectedIndex == 0 ? Colors.white : Colors.black),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.person, color: _selectedIndex == 1 ? Colors.white : Colors.black),
            ),
            label: 'Shop',
          ),
        ],
      ),
    );

  }

}
