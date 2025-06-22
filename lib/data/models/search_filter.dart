import 'package:flutter/material.dart';

class SearchFilterModel with ChangeNotifier {
  String _jlpt = 'All';
  String _grade = "All";
  String _searchBy = "All";

  String get jlpt => _jlpt;
  String get grade => _grade;
  String get searchBy => _searchBy;

  set jlpt(String newValue) {
    if (_jlpt != newValue) {
      _jlpt = newValue;
      notifyListeners();
    }
  }

  set grade(String newValue) {
    if (_grade != newValue) {
      _grade = newValue;
      notifyListeners();
    }
  }

  set searchBy(String newValue) {
    if (_searchBy != newValue) {
      _searchBy = newValue;
      notifyListeners();
    }
  }

  void resetFilters() {
    _jlpt = 'All';
    _grade = 'All';
    _searchBy = 'All';
    notifyListeners();
  }
}