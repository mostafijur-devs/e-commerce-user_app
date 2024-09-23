class OrderSettingModel {
  num deliveryFee;
  int discount;
  int vat;

  OrderSettingModel({
    this.deliveryFee = 0,
    this.discount = 0,
    this.vat = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryFee': deliveryFee,
      'discount': discount,
      'vat': vat,};
  }

  factory OrderSettingModel.fromMap(Map<String, dynamic> map) {
    return OrderSettingModel(
      deliveryFee: map['deliveryFee'] ?? 0,
      discount: map['discount'] ?? 0,
      vat: map['vat'] ?? 0,
    );
  }
}