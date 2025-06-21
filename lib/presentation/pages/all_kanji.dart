import 'package:flutter/material.dart';

class AllKanjiScreen extends StatelessWidget {
  const AllKanjiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the arguments in your screen
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: Text('All Kanji'),
        actions: <Widget>[],
      ),
    );
  }
}
