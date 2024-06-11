import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionTile extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;

  QuestionTile({
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[
                Theme.of(context).brightness == Brightness.light ? 200 : 800]!,
            blurRadius: 4.r,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors
            .grey[Theme.of(context).brightness == Brightness.light ? 200 : 800],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected
              ? isCorrect
                  ? Colors.green
                  : Colors.red
              : isAnswered && isCorrect
                  ? Colors.green
                  : Colors.grey[Theme.of(context).brightness == Brightness.light
                      ? 300
                      : 700]!,
        ),
      ),
      child: ListTile(
        title: Text(
          option,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
