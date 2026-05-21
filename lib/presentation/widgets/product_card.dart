import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/models/product.dart';

/// A reusable, self-contained card widget for displaying a single [Product].
///
/// Responsibilities:
///  - Render a placeholder image area with a gradient and emoji icon.
///  - Show the product title, description, and price.
///  - Provide a "View Details" button (UI-only — callback via [onViewDetails]).
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onViewDetails,
  });

  /// The product data to display.
  final Product product;

  /// Optional callback fired when the user taps "View Details".
  /// Pass null to keep the button visible but inactive.
  final VoidCallback? onViewDetails;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ── Placeholder Image Container ─────────────────────────────────
          _ProductImagePlaceholder(iconLabel: product.iconLabel),

          // ── Product Info ────────────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title
                  Text(
                    product.title,
                    style: AppTextStyles.productTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  // Short description
                  Text(
                    product.description,
                    style: AppTextStyles.bodyGrey,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Price
                  Text(
                    product.price,
                    style: AppTextStyles.productPrice,
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),

          // ── View Details Button ─────────────────────────────────────────
          _ViewDetailsButton(onPressed: onViewDetails),
        ],
      ),
    );
  }
}

// ── Private sub-widgets ─────────────────────────────────────────────────────

/// Gradient placeholder that simulates a product image area.
class _ProductImagePlaceholder extends StatelessWidget {
  const _ProductImagePlaceholder({required this.iconLabel});

  final String iconLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
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
          style: const TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }
}

/// Full-width "View Details" CTA button at the bottom of the card.
class _ViewDetailsButton extends StatelessWidget {
  const _ViewDetailsButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
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
