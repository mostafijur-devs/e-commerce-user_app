
import 'package:user_ecom_app/models/categoty_model.dart';

class ProductModel {
  String? id;
  String productName;
  CategoryModel categoryModel;
  num price;
  num stock;
  String description;
  String imageUrl;
  bool available;
  double averageRating;
  num discount;

  ProductModel(

  {
  this.id,
  required this.productName,
  required this.categoryModel,
  required  this.price,
  required this.stock,
  required  this.description,
  required this.imageUrl,
  this.available = true,
  this.averageRating = 0.0,
  this.discount = 0,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'categoryModel': categoryModel.toMap(),
      'price': price,
      'stock': stock,
      'description': description,
      'imageUrl': imageUrl,
      'available': available,
      'averageRating': averageRating,
      'discount': discount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      productName: map['productName'] ?? '',
      categoryModel: CategoryModel.fromMap(map['categoryModel']),
      price: map['price'] ?? 0,
      stock: map['stock'] ?? 0,
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      available: map['available'] ?? true,
      averageRating: map['averageRating'] ?? 0.0,
      discount: map['discount'] ?? 0,
    );
  }
  num get priceAfterDiscount {
    if(discount == 0){
      return price;
    }
    return price - (price * (discount / 100));
  }
}