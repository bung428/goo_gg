import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/firebase_options.dart';
import 'package:goo_gg_application/route/router.dart';
import 'package:goo_gg_application/service/app_service.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/service/native_calculate_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('App Config');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AuthService.instance.init();
  AppService.instance.init();
  NativeCalculateService.instance.init();

  await initializeDateFormatting();

  runApp(const ProviderScope(child: GooGGApp()));
}

class GooGGApp extends StatelessWidget {
  const GooGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GOO.GG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      // darkTheme: ThemeData.dark(),
      routerConfig: appRouters,
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.blueAccent,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE1F1FF),
  onPrimaryContainer: Color(0xFF007AFF),
  secondary: Color(0xFF00B3CC),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE7FAEE),
  onSecondaryContainer: Color(0xFF34C759),
  tertiary: Color(0xFFFF9500),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFF4E3),
  onTertiaryContainer: Color(0xFFFF9500),
  error: Color(0xFFFF3B30),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFEAEA),
  onErrorContainer: Color(0xFFFF3B30),
  outline: Color(0xFFEEEEEE),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF111111),
  surface: Color(0xFFFCF8FF),
  onSurface: Color(0xFF000000),
  // Text Color
  surfaceVariant: Color(0xFFE5E1EC),
  onSurfaceVariant: Color(0xFF47464F),
  inverseSurface: Color(0xFF313036),
  onInverseSurface: Color(0xFFF3EFF7),
  inversePrimary: Color(0xFFC5C0FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5C5698),
  outlineVariant: Color(0xFFC8C5D0),
  scrim: Color(0xFF000000),
);

extension TextStyleByTheme on ThemeData {
  Color get textColor => colorScheme.onSurface;

  Color get primaryTextColor => colorScheme.onPrimary;

  Color get secondTextColor => colorScheme.onSecondary;

  Color get tertiaryTextColor => colorScheme.onTertiary;

  Color get errorTextColor => colorScheme.onError;
}