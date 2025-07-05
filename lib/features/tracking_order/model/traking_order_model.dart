// list_orders_model.dart

class ListOrdersResponse {
  final String? message;
  final bool? status;
  final List<OrderModel>? data;

  ListOrdersResponse({
    this.message,
    this.status,
    this.data,
  });

  factory ListOrdersResponse.fromJson(Map<String, dynamic> json) {
    return ListOrdersResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
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

class OrderModel {
  final String? status;
  final int? orderNumber;
  final DateTime? createdAt;
  final double? totalBeforeDiscount;
  final double? totalAfterDiscount;
  final double? discountAmount;
  final List<OrderLine>? lines;

  OrderModel({
    this.status,
    this.orderNumber,
    this.createdAt,
    this.totalBeforeDiscount,
    this.totalAfterDiscount,
    this.discountAmount,
    this.lines,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'] as String?,
      orderNumber: json['order_number'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      totalBeforeDiscount: double.parse(json['total_befor_discount'].toString() ) ,
      totalAfterDiscount: double.parse(json['total_after_discount'].toString() ) ,
      discountAmount: double.parse(json['discount_amount'].toString() ) ,
      lines: (json['lines'] as List<dynamic>?)
          ?.map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'order_number': orderNumber,
      'created_at': createdAt?.toIso8601String(),
      'total_befor_discount': totalBeforeDiscount,
      'total_after_discount': totalAfterDiscount,
      'discount_amount': discountAmount,
      'lines': lines?.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderLine {
  final int? productQuantity;
  final Product? product;

  OrderLine({
    this.productQuantity,
    this.product,
  });

  factory OrderLine.fromJson(Map<String, dynamic> json) {
    return OrderLine(
      productQuantity: json['product_quantity'] as int?,
      product: json['product'] != null
          ? Product.fromJson(json['product'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_quantity': productQuantity,
      'product': product?.toJson(),
    };
  }
}

class Product {
  final int? id;
  final String? name;
  final String? description;
  final double? discount;
  final String? image;
  final List<String>? images;
  final double? price;
  final bool? active;
  final int? limit;
  final Category? category;
  final List<Offer>? offers;
  final List<Unit>? units;
  final double? weight;
  final bool? inFavourites;

  Product({
    this.id,
    this.name,
    this.description,
    this.discount,
    this.image,
    this.images,
    this.price,
    this.active,
    this.limit,
    this.category,
    this.offers,
    this.units,
    this.weight,
    this.inFavourites,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      discount: double.parse(json['discount'].toString()) ,
      image: json['image'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price:double.parse(json['price'].toString())   ,
      active: json['active'] as bool?,
      limit: json['limit'] as int?,
      category: json['category'] != null
          ? Category.fromJson(json['category'] as Map<String, dynamic>)
          : null,
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
      units: (json['units'] as List<dynamic>?)
          ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight:json['weight']!=null?double.parse(json['weight'].toString()):0,
      inFavourites: json['in_favourites'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'discount': discount,
      'image': image,
      'images': images,
      'price': price,
      'active': active,
      'limit': limit,
      'category': category?.toJson(),
      'offers': offers?.map((e) => e.toJson()).toList(),
      'units': units?.map((e) => e.toJson()).toList(),
      'weight': weight,
      'in_favourites': inFavourites,
    };
  }
}

class Category {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final List<Category>? subcategories;

  Category({
    this.id,
    this.name,
    this.description,
    this.image,
    this.subcategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'subcategories': subcategories?.map((e) => e.toJson()).toList(),
    };
  }
}

class Offer {
  final int? id;
  final String? name;
  final String? description;
  final int? amount;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? discount;
  final Pivot? pivot;

  Offer({
    this.id,
    this.name,
    this.description,
    this.amount,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.discount,
    this.pivot,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as int?,
      image: json['image'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      discount: (json['discount'] as num?)?.toDouble(),
      pivot: json['pivot'] != null
          ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'discount': discount,
      'pivot': pivot?.toJson(),
    };
  }
}

class Pivot {
  final int? productId;
  final int? offerId;

  Pivot({
    this.productId,
    this.offerId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      productId: json['product_id'] as int?,
      offerId: json['offer_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'offer_id': offerId,
    };
  }
}

class Unit {
  final int? id;
  final String? unitName;
  final int? quantity;
  final double? price;
  final bool? isSellable;

  Unit({
    this.id,
    this.unitName,
    this.quantity,
    this.price,
    this.isSellable,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'] as int?,
      unitName: json['unit_name'] as String?,
      quantity: json['quantity'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      isSellable: json['is_sellable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unit_name': unitName,
      'quantity': quantity,
      'price': price,
      'is_sellable': isSellable,
    };
  }
}
