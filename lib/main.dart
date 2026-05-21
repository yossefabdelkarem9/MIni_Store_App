// ============================================================
//  main.dart — Mini Store App entry point
//
//  Folder structure:
//  lib/
//  ├── core/
//  │   └── constants/
//  │       ├── app_colors.dart        ← Color palette constants
//  │       └── app_text_styles.dart   ← Typography constants
//  ├── data/
//  │   ├── models/
//  │   │   └── product.dart           ← Product data model
//  │   └── repositories/
//  │       └── product_repository.dart ← Static data source
//  ├── presentation/
//  │   ├── screens/
//  │   │   └── home_screen.dart       ← Main UI screen
//  │   └── widgets/
//  │       └── product_card.dart      ← Reusable product card widget
//  └── main.dart                      ← App entry point (this file)
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/app_colors.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock status bar to a light (white icon) style to match the blue AppBar.

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,   // Android
      statusBarBrightness: Brightness.dark,         // iOS
    ),
  );

  runApp(const MiniStoreApp());
}

/// Root widget of the application.
///
/// Configures [MaterialApp] with a blue-primary theme that mirrors our
/// [AppColors] constants. Using [ThemeData] here means Flutter's default
/// widgets (e.g. SnackBar ripple, splash) also inherit the brand palette.
class MiniStoreApp extends StatelessWidget {
  const MiniStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Store',
      debugShowCheckedModeBanner: false,

      // ── Global Theme ──────────────────────────────────────────────────────
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          onPrimary: AppColors.textOnPrimary,
          surface: AppColors.surface,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto', // System font; swap to a Google Font if desired
        splashColor: AppColors.primaryLight.withValues(alpha: 0.15),
        highlightColor: Colors.transparent,
      ),

      // ── Initial Route ─────────────────────────────────────────────────────
      home: const HomeScreen(),
    );
  }
}
