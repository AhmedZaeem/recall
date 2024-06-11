import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/quizzes/presentation/widgets/exit_quiz_confirmation.dart';
import 'package:recall/quizzes/presentation/widgets/question_timer_widget.dart';
import 'package:recall/quizzes/presentation/widgets/show_result_alert.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

import '../../../l10n/l10n.dart';
import '../../models/question_model.dart';
import '../widgets/question_tile.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView(
      {super.key, required this.questions, required this.quizId});

  final List<QuestionModel> questions;
  final int quizId;

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int currentQuestion = 0;
  int selectedAnswer = -1;
  int timeLeft = 10;
  int totalScore = 0;
  bool isAnswered = false;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        nextQuestion();
      }
    });
  }

  void nextQuestion() {
    selectedAnswer == widget.questions[currentQuestion].answerIndex
        ? totalScore += timeLeft
        : null;
    timeLeft = 10;
    if (currentQuestion < widget.questions.length - 1) {
      currentQuestion++;
      isAnswered = false;
      selectedAnswer = -1;
      startTimer();
      setState(() {});
    } else {
      timer?.cancel();
      ShowResultAlert.showResult(
        context,
        totalScore,
        widget.questions.length,
        widget.quizId,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<QuizCubit>();
    AppLocalizations l10n = AppLocalizations.of(context);
    isAnswered = timeLeft == 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => ExitQuizConfirmation.show(context),
        ),
        title: Text(l10n.quiz),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              QuestionTimerWidget(
                isCorrect: selectedAnswer ==
                    widget.questions[currentQuestion].answerIndex,
                timeLeft: timeLeft,
                timerIsActive: timer?.isActive ?? false,
              ),
              SizedBox(height: 32.h),
              Text(
                widget.questions[currentQuestion].question,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize:
                          widget.questions[currentQuestion].question.length >
                                  200
                              ? 14.sp
                              : 24.sp,
                    ),
              ),
              SizedBox(height: 32.h),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: isAnswered
                        ? null
                        : () {
                            if (!isAnswered) {
                              setState(() {
                                selectedAnswer = index;
                                isAnswered = true;
                                if (timer?.isActive ?? false) {
                                  timer?.cancel();
                                  Future.delayed(
                                      Duration(seconds: 2), nextQuestion);
                                }
                              });
                            }
                          },
                    child: QuestionTile(
                      option: widget.questions[currentQuestion].options[index],
                      isSelected: selectedAnswer == index,
                      isCorrect:
                          widget.questions[currentQuestion].answerIndex ==
                              index,
                      isAnswered: isAnswered,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 32.h),
                itemCount: widget.questions[currentQuestion].options.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
