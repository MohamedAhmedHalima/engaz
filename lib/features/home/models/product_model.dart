// models/products_response.dart

class ProductModel {
  String? message;
  bool? status;
  ProductsData? data;

  ProductModel({this.message, this.status, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] != null
          ? ProductsData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };
}

class ProductsData {
  List<Products>? products;
  Pagination? pagination;

  ProductsData({this.products, this.pagination});

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': products?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };
}

class Products {
  int? id;
  String? name;
  String? description;
  String? discount_type;
  int? discount;
  int? cartQuantity;
  int? quantity;
  String? image;
  List<String>? images;
  double? price;
  double? price_after_discount;
  bool? active;
  int? limit;
  Category? category;
  List<Offer>? offers;
  List<Unit>? units;
  double? weight;
  bool? inFavourites;

  Products({
    this.id,
    this.name,
    this.description,
    this.discount_type,
    this.price_after_discount,
    this.discount,
    this.cartQuantity,
    this.image,
    this.images,
    this.price,
    this.active,
    this.limit,
    this.quantity,
    this.category,
    this.offers,
    this.units,
    this.weight,
    this.inFavourites,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
      discount_type: json['discount_type'] as String?,
      description: json['description'] as String?,
      discount: json['discount'] as int?,
      cartQuantity:json['cart_quantity']!=null? json['cart_quantity'] as int?:0,
      price_after_discount:json['price_after_discount']!=null? double.parse( json['price_after_discount'].toString()) :0,
      image: json['image'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price:double.parse( json['price'].toString()) ,
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
      weight:json['weight']!=null ?double.parse(json['weight'].toString()):json['weight'],
      inFavourites: json['in_favourites'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'discount_type': discount_type,
    'discount': discount,
    'quantity': quantity,
    'image': image,
    'cart_quantity': cartQuantity,
    'price_after_discount': price_after_discount,
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

class Category {
  int? id;
  String? name;
  String? description;
  String? image;
  List<Category>? subcategories;

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image,
    'subcategories': subcategories?.map((e) => e.toJson()).toList(),
  };
}

class Offer {
  int? id;
  String? name;
  String? description;
  int? amount;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? discount;

  Offer({
    this.id,
    this.name,
    this.description,
    this.amount,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.discount,
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
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'amount': amount,
    'image': image,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'discount': discount,
  };
}

class Unit {
  String? unitName;
  int? quantity;
  int? id;
  double? price_after_discount;
  double? price;
  bool? is_sellable;

  Unit({this.unitName, this.quantity, this.price_after_discount,  this.is_sellable, this.id, this.price});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      unitName: json['unit_name'] as String?,
      is_sellable: json['is_sellable'] as bool?,
      quantity: json['quantity'] as int?,
      id: json['id'] as int?,
      price_after_discount: json['price_after_discount'] !=null ?double.parse(json['price_after_discount'].toString()): 0,
      price: (json['price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'unit_name': unitName,
    'quantity': quantity,
    'price_after_discount': price_after_discount,
    'id': id,
    'is_sellable': is_sellable,
    'price': price,
  };
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? totalPages;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'] as int?,
      count: json['count'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      totalPages: json['total_pages'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'count': count,
    'per_page': perPage,
    'current_page': currentPage,
    'last_page': lastPage,
    'total_pages': totalPages,
  };
}
