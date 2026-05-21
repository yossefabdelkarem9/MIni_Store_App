import '../models/product.dart';

/// Static data source for the Mini Store.
/// Replaces a real API or database — swap this list to connect a backend later.
class ProductRepository {
  ProductRepository._(); // Prevent instantiation — purely static

  /// Returns the full list of available products.
  static List<Product> getProducts() {
    return const <Product>[
      Product(
        id: 'p1',
        title: 'Smartphone',
        price: '\$799.99',
        description: '6.7" AMOLED · 256 GB · 5G Ready',
        iconLabel: '📱',
      ),
      Product(
        id: 'p2',
        title: 'Headphones',
        price: '\$249.99',
        description: 'Active Noise Cancelling · 30 h battery',
        iconLabel: '🎧',
      ),
      Product(
        id: 'p3',
        title: 'Smart Watch',
        price: '\$349.99',
        description: 'Health tracking · GPS · Always-on display',
        iconLabel: '⌚',
      ),
      Product(
        id: 'p4',
        title: 'Laptop',
        price: '\$1,299.99',
        description: '14" 2K · 16 GB RAM · M-series chip',
        iconLabel: '💻',
      ),
    ];
  }
}
