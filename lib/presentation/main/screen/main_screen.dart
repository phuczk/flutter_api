import 'package:api_flutter/presentation/main/widget/bottom_menu_widget.dart';
import 'package:api_flutter/presentation/music/screen/music_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MusicScreen(),
    const Center(
        child: Text(
      "Comming Soon",
      style: TextStyle(color: Colors.white),
    )),
    const Center(
        child: Text(
      "Comming Soon",
      style: TextStyle(color: Colors.white),
    )),
    const Center(
        child: Text(
      "Comming Soon",
      style: TextStyle(color: Colors.white),
    )),
    const Center(
        child: Text(
      "Comming Soon",
      style: TextStyle(color: Colors.white),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(23, 23, 23, 0.95),
          ),
          SafeArea(
            child: _pages[_currentIndex],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: BottomMenuWidget(
              currentIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
