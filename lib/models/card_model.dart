class CardModel{
  final String productId;
  final String name;
  final String price;
  final String image;
  final num quantity;
  CardModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });
  Map<String, dynamic> toMap() {
    return {'productId': productId,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }
}