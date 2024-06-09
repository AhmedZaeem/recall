import 'package:flutter/material.dart';

import 'deck_alerts.dart';

class AddDeckFloatingActionButton extends StatelessWidget {
  const AddDeckFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => DeckAlerts.addDeck(context),
      child: Icon(Icons.add),
    );
  }
}
