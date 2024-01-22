import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/route/router.dart';
import 'package:goo_gg_application/service/app_service.dart';
import 'package:goo_gg_application/service/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AuthService.instance.init();
  AppService.instance.init();

  runApp(const ProviderScope(child: GooGGApp()));
}

class GooGGApp extends StatelessWidget {
  const GooGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Goo.gg',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouters,
    );
  }
}