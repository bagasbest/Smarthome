import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smarthome/screens/add_new_scene.dart';
import 'package:smarthome/screens/home.dart';
import 'package:smarthome/screens/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  final tabs = [
    Home(),
    AddNewScene(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: (_currentIndex == 0) ? Colors.blue : Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: (_currentIndex == 1) ? Colors.blue : Colors.black,
              ),
              label: "Scene",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outline,
                color: (_currentIndex == 2) ? Colors.blue : Colors.black,
              ),
              label: "Profil",
            ),
          ],
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: tabs[_currentIndex],
    );
  }
}
