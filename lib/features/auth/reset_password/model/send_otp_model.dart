class SendOtpModel {
  final bool status;
  final String message;
  SendOtpModel({required this.status, required this.message});
  factory SendOtpModel.fromJson(Map<String, dynamic> json) {
    return SendOtpModel(
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
