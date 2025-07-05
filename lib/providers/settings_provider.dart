import 'package:flutter/widgets.dart';

class SettingsProvider with ChangeNotifier {
  bool _showRomaji = true;

  bool get showRomaji => _showRomaji;

  void toggleRomaji(bool value)
  {
    _showRomaji = value;
    notifyListeners();
  }
}