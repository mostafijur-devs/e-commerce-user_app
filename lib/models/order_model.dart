import 'package:user_ecom_app/models/address_model.dart';
import 'package:user_ecom_app/models/categoty_model.dart';
import 'package:user_ecom_app/models/order_setting_model.dart';
import 'package:user_ecom_app/models/user_model.dart';

import 'date_model.dart';

class OrderModel {

  String? orderId;
  DateModel dateModel;
  UserModel userModel;
  String orderStatus;
  num grandTotal;
  AddressModel deliveryAddress;
  OrderSettingModel orderSettingModel;
  String? aditionalInfo;
  List<CategoryModel> cartList;

  OrderModel({
    this.orderId,
    required this.dateModel,
    required this.userModel,
    required this.orderStatus,
    required this.grandTotal,
    required this.deliveryAddress,
    required this.orderSettingModel,
    this.aditionalInfo,
    required this.cartList
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'dateModel': dateModel.toMap(),
      'userModel': userModel.toMap(),
      'orderStatus': orderStatus,
      'grandTotal': grandTotal,
      'deliveryAddress': deliveryAddress.toMap(),
      'orderSettingModel': orderSettingModel.toMap(),
      'aditionalInfo': aditionalInfo,
      'cartList': cartList.map((category) => category.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      dateModel: DateModel.fromMap(map['dateModel']),
      userModel: UserModel.fromMap(map['userModel']),
      orderStatus: map['orderStatus'] ?? '',
      grandTotal: map['grandTotal'] ?? 0,
      deliveryAddress: AddressModel.fromMap(map['deliveryAddress']),
      orderSettingModel: OrderSettingModel.fromMap(map['orderSettingModel']),
      aditionalInfo: map['aditionalInfo'],
      cartList: List<CategoryModel>.from(
        (map['cartList'] as List<dynamic>).map(
              (category) => CategoryModel.fromMap(category),
        ),
      ),
    );
  }
}