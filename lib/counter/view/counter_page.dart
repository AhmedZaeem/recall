import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recall/app/theme/cubit.dart';
import 'package:recall/counter/counter.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
        child: Text(l10n.counterAppBarTitle),
      ),
    );
  }
}
