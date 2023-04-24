class PhoneLoginRequestModel {
  String? phone;
  String? source;

  PhoneLoginRequestModel({this.phone, this.source});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['source'] = source;
    return data;
  }
}
