import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> load() async {
    await Future.delayed(Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}
