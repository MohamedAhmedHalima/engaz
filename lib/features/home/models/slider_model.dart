class SliderModel {
  String? message;
  bool? status;
  List<Data>? data;

  SliderModel({this.message, this.status, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  int? productId;
  int? categoryId;
  int? offerId;
  String? image;

  Data(
      {this.id,
        this.title,
        this.description,
        this.productId,
        this.categoryId,
        this.offerId,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    offerId = json['offer_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['offer_id'] = this.offerId;
    data['image'] = this.image;
    return data;
  }
}
