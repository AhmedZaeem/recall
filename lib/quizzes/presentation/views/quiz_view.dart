import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recall/app/presentation/widgets/no_data.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/presentation/views/quizzes_list_view.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

import '../../../app/presentation/widgets/view_header.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    var quizzes = context.watch<QuizCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          ViewHeader(title: l10n.quizzes),
          quizzes.state.isEmpty
              ? NoData(title: l10n.oops, message: l10n.noExams)
              : QuizzesListView(quizzes: quizzes.state),
        ],
      ),
    );
  }
}
