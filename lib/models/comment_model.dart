

import 'package:user_ecom_app/models/user_model.dart';

class CommetModel {
  UserModel userModel;
  String productId;
  String comment;
  bool approved;

  CommetModel({
    required this.userModel,
    required this.productId,
    required this.comment,
    required this.approved,
  });

  Map<String, dynamic> toMap() {
    return {
      'userModel': userModel.toMap(),
      'productId': productId,
      'comment': comment,
      'approved': approved,
    };
  }

  factory CommetModel.fromMap(Map<String, dynamic> map) {
    return CommetModel(
      userModel: UserModel.fromMap(map['userModel']),
      productId: map['productId'] ?? '',
      comment: map['comment'] ?? '',
      approved: map['approved'] ?? false,
    );
  }
}