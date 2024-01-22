import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/pages/main/main_notifier.dart';
import 'package:goo_gg_application/route/routes.dart';

class MainPage extends RiverProvider<MainNotifier, MainViewModel> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, provider, MainNotifier notifier) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            const Text('main page'),
            TextButton(
                onPressed: () => context.go(Routes.splash.name),
                child: const Text('move splash')
            ),
            TextButton(
                onPressed: () => context.go(Routes.login.name),
                child: const Text('move login')
            ),
          ],
        ),
      ),
    );
  }

  @override
  MainNotifier createProvider(ref) => MainNotifier(MainViewModel());
}