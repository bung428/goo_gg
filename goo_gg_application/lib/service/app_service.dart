import 'package:flutter/material.dart';
import 'package:goo_gg_application/service/auth_service.dart';

class AppService with ChangeNotifier {
  static final AppService instance = AppService._();

  AppService._();

  bool _isLogin = false;

  bool get isLogin => _isLogin;
  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  void init() {
    AuthService.instance.userStream.listen((model) {
      _isLogin = model != null;
    });
  }
}