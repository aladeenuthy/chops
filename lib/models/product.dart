class Product {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  final bool isFavorite;
  final String category;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.images,
      required this.isFavorite,
      required this.category});
  factory Product.fromFirestore(
      Map<String, dynamic> data, String id, bool isFavorite) {
    final int price = data['price'];
    return Product(
        id: id,
        name: data['name'],
        price: price.toDouble(),
        images: List.of(<String>[...data['images']]),
        isFavorite: isFavorite,
        category: data['category']);
  }
}
