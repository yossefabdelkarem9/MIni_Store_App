/// Data model representing a single product in the store.
/// Immutable — all fields are final. No backend or API dependency.
class Product {
  final String id;
  final String title;
  final String price;        // Formatted price string (e.g. "\$299.99")
  final String description;  // Short subtitle shown on the card
  final String iconLabel;    // Used to display an icon/emoji placeholder

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.iconLabel,
  });
}
