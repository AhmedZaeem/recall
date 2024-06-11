import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/l10n/l10n.dart';

class QuestionTimerWidget extends StatelessWidget {
  const QuestionTimerWidget(
      {super.key,
      required this.timeLeft,
      required this.timerIsActive,
      required this.isCorrect});

  final int timeLeft;
  final bool timerIsActive;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context);
    return timerIsActive
        ? SizedBox(
            width: 90.w,
            height: 90.w,
            child: Stack(
              children: [
                SizedBox(
                  width: 90.w,
                  height: 90.w,
                  child: CircularProgressIndicator(
                    value: timeLeft / 10,
                    color: timeLeft <= 5
                        ? Colors.red[1000 - timeLeft * 100]
                        : Colors.deepPurple[1000 - timeLeft * 100],
                    strokeWidth: 4.w,
                  ),
                ),
                Center(
                  child: Text(
                    timeLeft.toString(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: timeLeft < 6
                              ? Colors.red[1000 - (timeLeft * 100)]
                              : (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                  ),
                ),
              ],
            ),
          )
        : Text(
            isCorrect ? l10n.correctAnswer : l10n.wrongAnswer,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isCorrect ? Colors.green : Colors.red,
                ),
          );
  }
}
