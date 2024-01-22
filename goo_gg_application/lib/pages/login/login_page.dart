import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:goo_gg_application/data/login/user_model.dart';
import 'package:goo_gg_application/pages/login/login_notifier.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';
import 'package:goo_gg_application/widget/keyboard_visibility_builder_widget.dart';

class LoginPage extends RiverProvider<LoginNotifier, LoginViewModel> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, provider, LoginNotifier notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 24),
          child: _buildLoginForm(theme, provider, notifier),
        ),
      ),
    );
  }

  Widget _buildLoginForm(ThemeData theme, provider, notifier) => Column(
    children: [
      const SizedBox(height: 100,),
      AssetImageWidget(
        image: 'nine',
        size: 200,
        borderRadius: BorderRadius.circular(8),
      ),
      const SizedBox(height: 66,),
      TextFormField(
        controller: notifier.emailController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          label: Text(
            'Email',
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.primaryColor.withOpacity(0.7)
            ),
          ),
          hintText: 'Email',
          border: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // onChanged: _onChangedSearchText,
      ),
      const SizedBox(height: 16,),
      TextFormField(
        controller: notifier.pwdController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          label: Text(
            'Password',
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.primaryColor.withOpacity(0.7)
            ),
          ),
          hintText: 'Password',
          border: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onEditingComplete: notifier.completeLoginInfo,
      ),
      const SizedBox(height: 24,),
      ElevatedButton(
          onPressed: () {
            if (notifier.btnEnable) {
              notifier.login();
            }
          },
          child: const SizedBox(
              width: double.infinity,
              height: 44,
              child: Center(child: Text('login'))
          )
      ),
    ],
  );

  @override
  LoginNotifier createProvider(ref) =>
      LoginNotifier(LoginViewModel(userModel: UserModel.init()));
}