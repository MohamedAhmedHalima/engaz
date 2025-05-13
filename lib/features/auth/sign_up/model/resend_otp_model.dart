class ResendOtpModel {
  final bool status;
  final String message;
  ResendOtpModel({required this.status, required this.message});
  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
