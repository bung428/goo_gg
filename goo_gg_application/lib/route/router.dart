import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/pages/login/login_page.dart';
import 'package:goo_gg_application/pages/main/main_page.dart';
import 'package:goo_gg_application/pages/match_detail/match_detail_page.dart';
import 'package:goo_gg_application/pages/splash/splash_page.dart';
import 'package:goo_gg_application/route/routes.dart';
import 'package:goo_gg_application/service/app_service.dart';

final appRouters = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.splash.name,
  refreshListenable: AppService.instance,
  routes: [
    GoRoute(
      path: Routes.main.name,
      name: Routes.main.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          )
      ),
      routes: [
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
        GoRoute(
          path: Routes.login.path,
          name: Routes.login.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
        GoRoute(
          path: Routes.matchDetail.path,
          name: Routes.matchDetail.name,
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const MatchDetailPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  )
          ),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final appService = AppService.instance;

    final homeLocation = state.namedLocation(Routes.main.name);
    final loginLocation = state.namedLocation(Routes.login.name);
    final splashLocation = state.namedLocation(Routes.splash.name);

    final isLoggedIn = appService.isLogin;

    final isGoingToInit = state.matchedLocation == splashLocation;
    final isGoingToLogin = state.matchedLocation == loginLocation;

    if (isGoingToInit) {
      return splashLocation;
    } else if (!isLoggedIn && !isGoingToLogin) {
      return loginLocation;
    } else if ((isLoggedIn && isGoingToLogin) || (isGoingToInit)) {
      return homeLocation;
    } else {
      return null;
    }
  }
);