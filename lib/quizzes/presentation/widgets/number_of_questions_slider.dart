import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';
import 'package:recall/l10n/l10n.dart';

class NumberOfQuestionsSlider extends StatelessWidget {
  const NumberOfQuestionsSlider({
    super.key,
    required this.sliderValue,
    this.onChangeEnd,
    required this.flashcardsListLength,
  });
  final double sliderValue;
  final int flashcardsListLength;
  final Function(double value)? onChangeEnd;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(l10n.numberOfQuestions),
        InputSlider(
          onChangeEnd: onChangeEnd,
          activeSliderColor: Theme.of(context).primaryColorDark,
          fillColor: Theme.of(context).hoverColor,
          min: 4,
          max: flashcardsListLength.toDouble(),
          decimalPlaces: 0,
          division:
              (flashcardsListLength - 4) > 0 ? flashcardsListLength - 4 : 1,
          defaultValue: 4,
          onChange: (double) {},
        ),
      ],
    );
  }
}
