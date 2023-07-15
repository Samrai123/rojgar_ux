import 'package:flutter/material.dart';
import 'package:rojgar/screens/alerts/a.dart';
import 'package:rojgar/screens/alerts/alert.dart';
import 'package:rojgar/screens/home/master.dart';

import 'package:rojgar/screens/home_screen.dart';
import 'package:rojgar/screens/profile/profile_screen.dart';
import 'package:rojgar/screens/saved/apply_job.dart';

import 'package:rojgar/screens/saved/saved_job.dart';
import 'package:rojgar/screens/search/search.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  List<Widget> lstWidget = [
    Master(),
    const SaveJobs(),
    const AlertScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: lstWidget[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
