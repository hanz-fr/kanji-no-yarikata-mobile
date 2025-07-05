import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final settings = Provider.of<SettingsProvider>(context);

    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Show Romaji"),
          Switch(
            value: settings.showRomaji,
            onChanged: settings.toggleRomaji,
          ),
        ],
      ),
    );
  }
}
