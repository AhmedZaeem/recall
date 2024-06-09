import 'package:flutter/material.dart';

class AddQuizFloatingActionButton extends StatelessWidget {
  const AddQuizFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
