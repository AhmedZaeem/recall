import 'package:flutter/material.dart';
import 'package:recall/l10n/l10n.dart';

import '../../../app/presentation/widgets/view_header.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        ViewHeader(title: l10n.flashcards),
      ],
    );
  }
}
