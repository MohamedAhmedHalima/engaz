import '../../home/models/product_model.dart';

class FavouriteListModel {
  final String? message;
  final bool? status;
  final List<Products>? data;

  FavouriteListModel({
    this.message,
    this.status,
    this.data,
  });

  factory FavouriteListModel.fromJson(Map<String, dynamic> json) {
    return FavouriteListModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null
          ? List<Products>.from(
        json['data'].map((x) => Products.fromJson(x)),
      )
          : null,
    );
  }
}
