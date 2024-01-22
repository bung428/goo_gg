import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/route/routes.dart';
import 'package:loading_redman_ddur/loading_redman_ddur.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    showSplash();
    super.initState();
  }

  Future<void> showSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go(Routes.main.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: ManAnim(size: 1,),
        ),
      ),
    );
  }
}