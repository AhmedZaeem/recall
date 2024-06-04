import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recall/l10n/l10n.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {required this.currentIndex, required this.onTap, super.key});
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: currentIndex,
      selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/${currentIndex == 0 ? 'flashcards_selected' : 'flashcards'}.svg',
          ),
          label: l10n.flashcards,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/${currentIndex == 1 ? 'quiz_selected' : 'quiz'}.svg',
          ),
          label: l10n.quizzes,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: l10n.settings,
        ),
      ],
    );
  }
}
