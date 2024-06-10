import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/models/quiz_model.dart';
import 'package:recall/quizzes/presentation/widgets/show_quiz_details_alert.dart';

class QuizListTile extends StatelessWidget {
  const QuizListTile({super.key, required this.quiz});
  final QuizModel quiz;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors
            .grey[Theme.of(context).brightness == Brightness.light ? 200 : 800],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        title: Text(quiz.title),
        trailing: _buildStartButton(context, l10n.start),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () => ShowQuizDetailsAlert.showAlert(context, quiz),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(text),
          Icon(Icons.play_arrow),
        ],
      ),
    );
  }
}
