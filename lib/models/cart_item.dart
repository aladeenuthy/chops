class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  final int quantity;
  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity});

  factory CartItem.fromFirestore(Map<String, dynamic> data, String id) {
    
    return CartItem(
        id: id,
        name: data['name'],
        price: data['price'],
        image: data['image'],
        quantity: data['quantity']);
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price, 'image': image, 'quantity': quantity};
  }
}
