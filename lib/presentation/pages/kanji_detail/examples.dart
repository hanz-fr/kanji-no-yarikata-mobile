import 'package:flutter/material.dart';

class KanjiExamplesContainer extends StatelessWidget {
  const KanjiExamplesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(color: Color.fromRGBO(208, 208, 208, 1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Examples"),
            const Padding(padding: EdgeInsetsGeometry.only(bottom: 1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              ],
            ),
          ],
        ),
      ),
    );
  }
}