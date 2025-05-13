import '../../sign_up/model/sign_up_model.dart';

class LoginModel {
  String? message;
  bool? status;
  Data? data;

  LoginModel({this.message, this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;
  UserData? user;

  Data(
      {this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
