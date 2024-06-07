import 'package:flutter/material.dart';
import 'package:recall/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:recall/quizzes/quiz.dart';
import 'package:recall/settings/settings.dart';

import '../../../flashcards_decks/presentation/views/flashcards_decks_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (value) => setState(() => _currentIndex = value),
        children: [
          const FlashcardsDeckView(),
          const QuizView(),
          const SettingsView(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          onTap: (value) => _controller.animateToPage(value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn),
          currentIndex: _currentIndex),
    );
  }
}
