import 'dart:convert';

class VerifyEmailModel {
  final bool status;
  final String message;
  VerifyEmailModel({required this.status, required this.message});
  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      status: json['status'],
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
