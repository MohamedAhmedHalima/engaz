
import '../../home/models/product_model.dart';

class CartModel {
  String? message;
  bool? status;
  List<CartItem>? data;

  CartModel({this.message, this.status, this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class CartItem {
  int? id;
  Products? product;
  int? quantity;
  Unit? unit;

  CartItem({this.id, this.product, this.quantity, this.unit});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as int?,
      product: json['product'] != null
          ? Products.fromJson(json['product'] as Map<String, dynamic>)
          : null,
      quantity: json['quantity'] as int?,
      unit: json['unit'] != null
          ? Unit.fromJson(json['unit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'quantity': quantity,
      'unit': unit?.toJson(),
    };
  }
}



