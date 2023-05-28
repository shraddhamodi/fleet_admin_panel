class AddressModel {
  String? ownerName;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  int? postalCode;
  String? latitude;
  String? longitude;
  bool? isDefault;

  AddressModel(this.ownerName,this.address1,this.address2,this.city,this.state,this.country,this.postalCode,this.latitude,this.longitude,this.isDefault);

  Map<String, dynamic> toMap() {
    return {
      'owner_name': ownerName,
      'address_1': address1,
      'address_2': address2,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'latitude': latitude,
      'longitude': longitude,
      'is_default': isDefault,
    };
  }

  AddressModel.fromJson(Map<String, dynamic> json) {
    ownerName = json['owner_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['is_default'];
  }

}