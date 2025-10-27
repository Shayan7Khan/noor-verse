import 'package:flutter/material.dart';

import 'package:noor_verse/ui/screens/hadith_screen/hadith_screen.dart';
import 'package:noor_verse/ui/screens/quran_screen/quran_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [QuranScreen(), HadithScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF202020),
          selectedItemColor: Color(0xFFC0A37C),
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'Hadith',
            ),
          ],
        ),
      ),
    );
  }
}
