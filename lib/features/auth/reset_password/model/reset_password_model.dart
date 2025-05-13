import 'dart:convert';

class ResetPasswordModel {
  final String status;
  final String message;
  ResetPasswordModel({
    required this.status,
    required this.message,
  });
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
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
