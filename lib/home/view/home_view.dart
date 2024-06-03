import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Center(child: Text('Home')),
        const Center(child: Text('Flashcards')),
        const Center(child: Text('Quizzes')),
        const Center(child: Text('Settings')),
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() => _currentIndex = value),
        currentIndex: _currentIndex,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/${_currentIndex == 1 ? 'flashcards_selected' : 'flashcards'}.svg'),
            label: 'Flashcards',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/${_currentIndex == 2 ? 'quiz_selected' : 'quiz'}.svg',
            ),
            label: 'Quizzes',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
