import 'package:flutter/material.dart';

class MainInformationContainer extends StatelessWidget {
  const MainInformationContainer({
    super.key,
    required this.radical,
    required this.radicalNumber,
    required this.frequency,
    required this.components,
    required this.joyoListStatus,
    required this.mnemonic,
  });

  final String radical;
  final int radicalNumber;
  final String frequency;
  final String? components;
  final String joyoListStatus;
  final String mnemonic;

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Radical:"),
                Text("$radical ($radicalNumber)"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("Frequency:"), Text(frequency)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Components:"),
                Text(components ?? ""),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("Joyo Status:"), Text(joyoListStatus)],
            ),
          ],
        ),
      ),
    );
  }
}
