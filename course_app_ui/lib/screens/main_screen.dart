import 'package:course_app_ui/screens/favourites_scree.dart';
import 'package:course_app_ui/screens/profile_screen.dart';
import 'package:course_app_ui/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _screens = [
    FavouritesScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 18,
                  backgroundColor:
                      _currentIndex == 0 ? Colors.white : Colors.transparent,
                  child: const Icon(Icons.favorite_outline)),
              label: 'Favourites'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 18,
                  backgroundColor:
                      _currentIndex == 1 ? Colors.white : Colors.transparent,
                  child: const Icon(Icons.search)),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 18,
                backgroundColor:
                    _currentIndex == 2 ? Colors.white : Colors.transparent,
                child: const Icon(Icons.person_outline),
              ),
              label: 'Account'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 11,
        showUnselectedLabels: false,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
      ),
    );
  }
}
