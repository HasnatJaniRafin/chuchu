class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String history;
  bool isFavorite;

  FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.history,
    this.isFavorite = false,
  });
}
