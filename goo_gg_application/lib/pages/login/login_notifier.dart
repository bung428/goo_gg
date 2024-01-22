import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:goo_gg_application/data/login/user_model.dart';
import 'package:goo_gg_application/service/auth_service.dart';

class LoginNotifier extends RiverNotifier<LoginViewModel> {
  LoginNotifier(super.state);

  final pwdController = TextEditingController();
  final emailController = TextEditingController();

  bool btnEnable = false;

  @override
  void onInit() {
    UserModel model = state.userModel;

    emailController.addListener(() {
      if (emailController.text.isNotEmpty) {
        model.email = emailController.text;
        state = state.copyWith(userModel: model);
        checkModelIsNotEmpty();
      }
    });
    pwdController.addListener(() {
      if (pwdController.text.isNotEmpty) {
        model.pwd = pwdController.text;
        state = state.copyWith(userModel: model);
        checkModelIsNotEmpty();
      }
    });
  }

  void checkModelIsNotEmpty() {
    UserModel model = state.userModel;
    if (model.modelIsNotEmpty) {
      btnEnable = true;

      model.recentAt = DateTime.now();
      state = state.copyWith(userModel: model);
    }
  }

  void completeLoginInfo() {
    if (pwdController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      btnEnable = true;

      UserModel model = state.userModel;
      model.email = emailController.text;
      model.pwd = pwdController.text;
      model.recentAt = DateTime.now();
      state = state.copyWith(userModel: model);
    }
  }

  Future<void> login() => AuthService.instance.signIn(state.userModel);
}

class LoginViewModel {
  final UserModel userModel;

  LoginViewModel({required this.userModel});

  LoginViewModel copyWith({
    UserModel? userModel
  }) => LoginViewModel(
    userModel: userModel ?? this.userModel
  );
}