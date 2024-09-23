import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_ecom_app/models/address_model.dart';

class UserModel {
  String uid;
  String email;
  Timestamp creationTime;
  String? name;
  String? mobile;
  AddressModel? address;
  String? imageUrl;

  UserModel({required this.uid,
    required this.email,
    required this.creationTime,
    this.name,
    this.mobile,
    this.address,
    this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'creationTime': creationTime,
      'name': name,
      'mobile': mobile,
      'address': address?.toMap(), // Convert AddressModel to map if not null
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      creationTime: map['creationTime'] ?? Timestamp.now(),
      name: map['name'],
      mobile: map['mobile'],
      address: map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      imageUrl: map['imageUrl'],
    );
  }
}
