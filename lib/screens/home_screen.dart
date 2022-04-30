import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';
import 'package:zoom/screens/history_meeting_screen.dart';
import 'package:zoom/screens/meeting_screen.dart';
import 'package:zoom/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  List<Widget> pages = [
    MeetinScreen(),
    const HistoryMeetingScreen(),
    const Text("Contacts"),
    const Text("Setting")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("Meet & Chat"),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onPageChanged,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: footerColor,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.comment_bank,
                ),
                label: "Meet & Char"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meetings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings"),
          ]),
    );
  }
}
