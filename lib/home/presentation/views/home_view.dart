import 'package:flutter/material.dart';
import 'package:recall/flashcards/flashcards.dart';
import 'package:recall/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:recall/quizzes/quiz.dart';
import 'package:recall/settings/settings.dart';

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
        const FlashcardsView(),
        const QuizView(),
        const SettingsView(),
      ][_currentIndex],
      bottomNavigationBar: BottomNavBar(
          onTap: (value) => setState(() => _currentIndex = value),
          currentIndex: _currentIndex),
    );
  }
}
