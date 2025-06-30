import 'package:flutter/material.dart';

class OnyomiKunyomiContainer extends StatelessWidget {
  const OnyomiKunyomiContainer({
    super.key,
    required this.onyomi,
    required this.onyomiRomaji,
    required this.kunyomi,
    required this.kunyomiRomaji,
  });

  final String? onyomi;
  final String? onyomiRomaji;
  final String? kunyomi;
  final String? kunyomiRomaji;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              spacing: 10,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(208, 208, 208, 1)),
                  ),
                  child: const Text("音読み", style: TextStyle(fontSize: 15)),
                ),
                Flexible(child: Text(onyomi as String)),
              ],
            ),
            Row(
              spacing: 10,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(208, 208, 208, 1)),
                  ),
                  child: const Text("訓読み", style: TextStyle(fontSize: 15)),
                ),
                Flexible(child: Text(kunyomi as String)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
