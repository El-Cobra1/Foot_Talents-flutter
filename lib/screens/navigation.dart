import 'package:flutter/material.dart';
import 'package:foottalents/screens/home.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _currentIndex = 1;

  final List<Widget> _screens = [
    Scaffold(),
    HomeScreen(),
    Scaffold(),
  ];

  final Map<String , IconData> _icons = {
    "My Team": Icons.telegram,
    "Discover": Icons.home,
    "Profile": Icons.person,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF262626),
        items: _icons.map((title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              icon: Icon(icon,size: 30,),
              label: title,
            )
        )).values.toList(),
        selectedItemColor: Color(0xFF8c54fc),
        currentIndex: _currentIndex,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
