class FavouriteModel {
  String status;
  String message;
  FavouriteData data;

  FavouriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      status: json['status'],
      message: json['message'],
      data: FavouriteData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class FavouriteData {
  Favourite favourite;

  FavouriteData({
    required this.favourite,
  });

  factory FavouriteData.fromJson(Map<String, dynamic> json) {
    return FavouriteData(
      favourite: Favourite.fromJson(json['favourite']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favourite': favourite.toJson(),
    };
  }
}

class Favourite {
  String user;
  String productId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Favourite({
    required this.user,
    required this.productId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      user: json['user'],
      productId: json['productId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'productId': productId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
