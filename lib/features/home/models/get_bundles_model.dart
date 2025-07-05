// bundles_model.dart

import 'package:engaz/features/home/models/product_model.dart';

class BundlesModel {
  List<BundleModelData>? data;

  BundlesModel({this.data});

  factory BundlesModel.fromJson(Map<String, dynamic> json) {
    return BundlesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BundleModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
  };
}

class BundleModelData {
  int? id;
  String? name;
  String? description;
  String? discountType;
  String? discountValue;
  double? total;
  double? total_after_discount;
  List<Products>? items;

  BundleModelData({
    this.id,
    this.name,
    this.total,
    this.total_after_discount,
    this.description,
    this.discountType,
    this.discountValue,
    this.items,
  });

  factory BundleModelData.fromJson(Map<String, dynamic> json) {
    return BundleModelData(
      id: json['id'] as int?,
      total: json['total']!=null?double.parse(json['total'].toString()):0 ,
      total_after_discount: json['total_after_discounr']!=null?double.parse(json['total_after_discounr'].toString()):0 ,
      name: json['name'] as String?,
      description: json['description'] as String?,
      discountType: json['discount_type'] as String?,
      discountValue: json['discount_value'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'total': total,
    'total_after_discounr': total_after_discount,
    'description': description,
    'discount_type': discountType,
    'discount_value': discountValue,
    'items': items?.map((e) => e.toJson()).toList(),
  };
}

// class BundleItem {
//   int? id;
//   int? productId;
//   String? productName;
//   int? quantity;
//   String? image;
//   List<String>? images;
//   String? price;
//   bool? active;
//   int? limit;
//   Category? category;
//   List<Offer>? offers;
//   double? weight;
//   bool? inFavourites;
//
//   BundleItem({
//     this.id,
//     this.productId,
//     this.productName,
//     this.quantity,
//     this.image,
//     this.images,
//     this.price,
//     this.active,
//     this.limit,
//     this.category,
//     this.offers,
//     this.weight,
//     this.inFavourites,
//   });
//
//   factory BundleItem.fromJson(Map<String, dynamic> json) {
//     return BundleItem(
//       id: json['id'] as int?,
//       productId: json['product_id'] as int?,
//       productName: json['product_name'] as String?,
//       quantity: json['quantity'] as int?,
//       image: json['image'] as String?,
//       images: (json['images'] as List<dynamic>?)
//           ?.map((e) => e as String)
//           .toList(),
//       price: json['price'] as String?,
//       active: json['active'] as bool?,
//       limit: json['limit'] as int?,
//       category: json['category'] != null
//           ? Category.fromJson(json['category'] as Map<String, dynamic>)
//           : null,
//       offers: (json['offers'] as List<dynamic>?)
//           ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       weight: (json['weight'] as num?)?.toDouble(),
//       inFavourites: json['in_favourites'] as bool?,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'product_id': productId,
//     'product_name': productName,
//     'quantity': quantity,
//     'image': image,
//     'images': images,
//     'price': price,
//     'active': active,
//     'limit': limit,
//     'category': category?.toJson(),
//     'offers': offers?.map((e) => e.toJson()).toList(),
//     'weight': weight,
//     'in_favourites': inFavourites,
//   };
// }

// class Category {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   List<Category>? subcategories;
//
//   Category({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.subcategories,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       description: json['description'] as String?,
//       image: json['image'] as String?,
//       subcategories: (json['subcategories'] as List<dynamic>?)
//           ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'description': description,
//     'image': image,
//     'subcategories': subcategories?.map((e) => e.toJson()).toList(),
//   };
// }

// class Offer {
//   int? id;
//   String? name;
//   String? description;
//   int? amount;
//   String? image;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   double? discount;
//   Pivot? pivot;
//
//   Offer({
//     this.id,
//     this.name,
//     this.description,
//     this.amount,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.discount,
//     this.pivot,
//   });
//
//   factory Offer.fromJson(Map<String, dynamic> json) {
//     return Offer(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       description: json['description'] as String?,
//       amount: json['amount'] as int?,
//       image: json['image'] as String?,
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'] as String)
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'] as String)
//           : null,
//       discount: (json['discount'] as num?)?.toDouble(),
//       pivot: json['pivot'] != null
//           ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
//           : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'description': description,
//     'amount': amount,
//     'image': image,
//     'created_at': createdAt?.toIso8601String(),
//     'updated_at': updatedAt?.toIso8601String(),
//     'discount': discount,
//     'pivot': pivot?.toJson(),
//   };
// }

class Pivot {
  int? productId;
  int? offerId;

  Pivot({this.productId, this.offerId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      productId: json['product_id'] as int?,
      offerId: json['offer_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'offer_id': offerId,
  };
}
