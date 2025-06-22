import 'package:flutter/widgets.dart';

/* model 'Settings' buat nyimpen dan ubah value dari state showRomaji */
class SettingsModel with ChangeNotifier {
  bool _showRomaji = true;

  bool get showRomaji => _showRomaji;

  void toggleRomaji(bool value)
  {
    _showRomaji = value;
    notifyListeners();
  }
}