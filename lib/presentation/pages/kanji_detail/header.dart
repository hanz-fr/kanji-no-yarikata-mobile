import 'package:flutter/material.dart';

class KanjiHeader extends StatelessWidget {
  const KanjiHeader({super.key});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: <Widget>[
                Text("N_", style: TextStyle(fontSize: 18)),
                Text("JLPT", style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(
              height: 24,
              child: VerticalDivider(
                color: Color.fromRGBO(208, 208, 208, 1),
                width: 5,
                thickness: 1,
              ),
            ),
            Column(
              children: <Widget>[
                Text("1", style: TextStyle(fontSize: 18)),
                Text("Grade", style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(
              height: 24,
              child: VerticalDivider(
                color: Color.fromRGBO(208, 208, 208, 1),
                width: 5,
                thickness: 1,
              ),
            ),
            Column(
              children: <Widget>[
                Text("10", style: TextStyle(fontSize: 18)),
                Text("Strokes", style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
