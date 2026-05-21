import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/models/product.dart';

/// A reusable, self-contained card widget for displaying a single [Product].
///
/// Uses [LayoutBuilder] so that the image placeholder scales proportionally
/// to whatever height the parent (GridView cell) provides — eliminating
/// Bottom Overflow on any screen size.
///
/// Layout contract:
///   • Image  → 42 % of available card height
///   • Info   → remaining space (title, description, price)
///   • Button → fixed 38 px, always pinned at the bottom
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onViewDetails,
  });

  /// The product data to display.
  final Product product;

  /// Optional callback fired when the user taps "View Details".
  final VoidCallback? onViewDetails;

  // ── Sizing constants ─────────────────────────────────────────────────────
  /// Fraction of card height used by the image placeholder.
  static const double _imageFraction = 0.42;

  /// Fixed height of the "View Details" button row (button + its padding).
  static const double _buttonRowHeight = 58.0; // 38 button + 20 padding

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.cardBorder, width: 1.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      // LayoutBuilder lets us read the exact height the GridView allocated,
      // so every internal measurement is relative — never overflows.
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double imageHeight = constraints.maxHeight * _imageFraction;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // ── Placeholder image ─────────────────────────────────────────
              _ProductImagePlaceholder(
                iconLabel: product.iconLabel,
                height: imageHeight,
              ),

              // ── Product info (fills remaining space between image & button) ─
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // Title — single line, ellipsis on overflow
                      Text(
                        product.title,
                        style: AppTextStyles.productTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),

                      // Description — max 2 lines, ellipsis on overflow
                      Text(
                        product.description,
                        style: AppTextStyles.bodyGrey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      // Price — pinned above the button via Spacer
                      Text(
                        product.price,
                        style: AppTextStyles.productPrice,
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),

              // ── "View Details" button — always at the bottom ──────────────
              SizedBox(
                height: _buttonRowHeight,
                child: _ViewDetailsButton(onPressed: onViewDetails),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ── Private sub-widgets ──────────────────────────────────────────────────────

/// Gradient image placeholder whose height is provided by the parent.
/// No hard-coded pixel value → scales cleanly across all screen sizes.
class _ProductImagePlaceholder extends StatelessWidget {
  const _ProductImagePlaceholder({
    required this.iconLabel,
    required this.height,
  });

  final String iconLabel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        gradient: LinearGradient(
          colors: <Color>[AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          iconLabel,
          style: const TextStyle(fontSize: 44.0),
        ),
      ),
    );
  }
}

/// Full-width "View Details" CTA — fixed height, always anchored at the bottom.
class _ViewDetailsButton extends StatelessWidget {
  const _ViewDetailsButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 10.0),
      child: SizedBox(
        height: 38.0,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textOnPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            'View Details',
            style: AppTextStyles.viewDetailsButton,
          ),
        ),
      ),
    );
  }
}
