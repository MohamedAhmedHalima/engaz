class CodeModel {
  final String message;

  CodeModel({required this.message});
  factory CodeModel.fromJson(Map<String, dynamic> json) {
    return CodeModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
