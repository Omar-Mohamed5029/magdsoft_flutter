import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:magdsoft_task/presentation/screens/presentations/favorite.dart';
import 'package:magdsoft_task/presentation/screens/presentations/logout.dart';
import 'package:magdsoft_task/presentation/screens/presentations/notification.dart';
import 'package:magdsoft_task/presentation/screens/presentations/setting.dart';

import '../presentations/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List screens = [
    const Logout_Screen(),
    const Favorite_screen(),
    const Home(),
    const Notification_screen(),
    const Setting_Screen(),
  ];
  int _selectedPageIndex = 2;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              // onTap: _selectPage,
              onTap: (i) => setState(() {
                _selectedPageIndex = i;
              }),
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout),
                  label: 'logout',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'favorite',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings"),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'home',
          elevation: 4,
          child: Icon(Icons.home),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
