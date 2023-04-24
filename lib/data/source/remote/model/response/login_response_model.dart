class PhoneLoginResponseModel {
  bool? success;
  String? leadType;

  PhoneLoginResponseModel({this.success, this.leadType});

  factory PhoneLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return PhoneLoginResponseModel(
      success: json['success'],
      leadType: json['lead_type'],
    );
  }
}
