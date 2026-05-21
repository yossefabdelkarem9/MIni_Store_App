import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Central text style definitions.
/// All Text widgets should use these styles for visual consistency.
class AppTextStyles {
  AppTextStyles._(); // Prevent instantiation

  // --- App Bar ---
  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.textOnPrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  // --- Product Card ---
  static const TextStyle productTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static const TextStyle productPrice = TextStyle(
    color: AppColors.primary,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
  );

  static const TextStyle viewDetailsButton = TextStyle(
    color: AppColors.textOnPrimary,
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  // --- Section / Body ---
  static const TextStyle sectionHeader = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyGrey = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
  );
}
