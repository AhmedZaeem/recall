import 'package:flutter/material.dart';
import 'package:recall/app/presentation/widgets/no_data.dart';
import 'package:recall/l10n/l10n.dart';

import '../../../app/presentation/widgets/view_header.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        ViewHeader(title: l10n.quizzes),
        NoData(title: l10n.oops, message: l10n.noExams),
      ],
    );
  }
}
