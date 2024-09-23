class AddressModel {
  String addressLine;
  String city;
  String zipCode;

  AddressModel({
    required this.addressLine,
    required this.city,
    required this.zipCode
  });
  Map<String, dynamic> toMap() {
    return {'addressLine': addressLine,
      'city': city,
      'zipCode': zipCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      addressLine: map['addressLine'] ?? '',
      city: map['city'] ?? '',
      zipCode: map['zipCode'] ?? '',
    );
  }
}
