import 'package:flutter/widgets.dart';

class ExamplesProvider with ChangeNotifier {
  bool _showKanaReading = true;

  bool get showKanaReading => _showKanaReading;

  void toggleHiragana(bool value)
  {
    _showKanaReading = value;
    notifyListeners();
  }
}
