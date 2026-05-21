import 'package:flutter/material.dart';

/// Central color palette for the Mini Store App.
/// All widgets must reference these constants — no hard-coded colors elsewhere.
class AppColors {
  AppColors._(); // Prevent instantiation

  // --- Primary Palette ---
  static const Color primary = Color(0xFF1565C0);        // Deep Blue
  static const Color primaryLight = Color(0xFF5E92F3);   // Light Blue (accents)
  static const Color primaryDark = Color(0xFF003C8F);    // Dark Blue (pressed states)

  // --- Background / Surface ---
  static const Color background = Color(0xFFFFFFFF);     // Pure White
  static const Color surface = Color(0xFFF5F7FA);        // Off-white card background
  static const Color cardBorder = Color(0xFFE3E8F0);     // Subtle card border

  // --- Text ---
  static const Color textPrimary = Color(0xFF1A1A2E);    // Near-black heading text
  static const Color textSecondary = Color(0xFF6B7280);  // Grey body / subtitle text
  static const Color textOnPrimary = Color(0xFFFFFFFF);  // White text on blue bg

  // --- Utility ---
  static const Color divider = Color(0xFFE5E7EB);
  static const Color iconGrey = Color(0xFF9CA3AF);
  static const Color shadow = Color(0x1A1565C0);         // Blue-tinted shadow
}
