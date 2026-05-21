import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';
import '../widgets/product_card.dart';

/// The main (and only) screen of the Mini Store App.
///
/// Displays a responsive [GridView] of [ProductCard] widgets built from
/// the static [ProductRepository]. No state management library is needed
/// since the data is static — a plain [StatelessWidget] is sufficient.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ── Static data ───────────────────────────────────────────────────────────
  /// Loaded once at build time from the static repository.
  static final List<Product> _products = ProductRepository.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: _buildAppBar(),

      // ── Body ───────────────────────────────────────────────────────────────
      body: _buildBody(context),
    );
  }

  // ── AppBar builder ─────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primary,
      centerTitle: false,
      title: const Text('Mini Store', style: AppTextStyles.appBarTitle),
      actions: const <Widget>[
        // Cart icon — UI only (no navigation wired)
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.textOnPrimary),
        ),
      ],
    );
  }

  // ── Body builder ───────────────────────────────────────────────────────────

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Thin gradient strip that continues the AppBar's blue
        _buildHeaderStrip(),

        // Section header
        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 4.0),
          child: Text('Featured Products', style: AppTextStyles.sectionHeader),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: Text(
            '${4} items available',          // Static count
            style: AppTextStyles.bodyGrey,
          ),
        ),

        // ── Product Grid ────────────────────────────────────────────────────
        Expanded(
          child: _buildProductGrid(context),
        ),
      ],
    );
  }

  /// A subtle gradient divider that bridges AppBar blue → white background.
  Widget _buildHeaderStrip() {
    return Container(
      height: 6.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[AppColors.primary, AppColors.background],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  /// Responsive [GridView.builder] — 2 columns on narrow screens,
  /// adapts gracefully via [crossAxisCount] derived from screen width.
  Widget _buildProductGrid(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Use 2 columns on phones (<600 dp), 3 on tablets/wide screens.
    final int crossAxisCount = screenWidth < 600 ? 2 : 3;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 24.0),
      itemCount: _products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 14.0,
        crossAxisSpacing: 14.0,
        // childAspectRatio controls card height; tune as needed.
        childAspectRatio: 0.72,
      ),
      itemBuilder: (BuildContext context, int index) {
        final Product product = _products[index];
        return ProductCard(
          product: product,
          // "View Details" is UI-only — wire navigation here when ready.
          onViewDetails: () => _onViewDetails(context, product),
        );
      },
    );
  }

  // ── Callbacks ──────────────────────────────────────────────────────────────

  /// Placeholder handler — replace with Navigator.push() when detail screen
  /// is implemented.
  void _onViewDetails(BuildContext context, Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} — coming soon!'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
