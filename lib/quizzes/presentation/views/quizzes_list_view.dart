import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/quizzes/presentation/widgets/quiz_list_tile.dart';

import '../../models/quiz_model.dart';

class QuizzesListView extends StatelessWidget {
  final List<QuizModel> quizzes;
  QuizzesListView({required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemBuilder: (_, index) => QuizListTile(quiz: quizzes[index]),
      separatorBuilder: (context, index) => QuizDivider(),
      itemCount: quizzes.length,
    );
  }
}

class QuizDivider extends StatelessWidget {
  const QuizDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 16.h,
      color: Theme.of(context).hoverColor,
      thickness: 2.h,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
