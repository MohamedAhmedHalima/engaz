class ProductModel {
  ProductModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final bool? status;
  final ProductData? data;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };
}

class ProductData {
  ProductData({
    required this.products,
    required this.pagination,
  });

  final List<Products> products;
  final Pagination? pagination;

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: json["data"] == null
          ? []
          : List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": products.map((x) => x.toJson()).toList(),
    "pagination": pagination?.toJson(),
  };
}

class Products {
  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.discount,
    required this.image,
    required this.images,
    required this.price,
    required this.active,
    required this.limit,
    required this.category,
    required this.offers,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? discount;
  final String? image;
  final List<String> images;
  final int? price;
  final bool? active;
  final int? limit;
  final Category? category;
  final List<Offer> offers;

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      discount: json["discount"],
      image: json["image"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]),
      price: json["price"],
      active: json["active"],
      limit: json["limit"],
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      offers: json["offers"] == null
          ? []
          : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "discount": discount,
    "image": image,
    "images": images,
    "price": price,
    "active": active,
    "limit": limit,
    "category": category?.toJson(),
    "offers": offers.map((x) => x.toJson()).toList(),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.subcategories,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final List<Category> subcategories;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      subcategories: json["subcategories"] == null
          ? []
          : List<Category>.from(json["subcategories"].map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "subcategories": subcategories.map((x) => x.toJson()).toList(),
  };
}

class Offer {
  Offer({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? amount;
  final String? image;

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      amount: json["amount"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "amount": amount,
    "image": image,
  };
}

class Pagination {
  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.totalPages,
  });

  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final int? totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json["total"],
      count: json["count"],
      perPage: json["per_page"],
      currentPage: json["current_page"],
      lastPage: json["last_page"],
      totalPages: json["total_pages"],
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "last_page": lastPage,
    "total_pages": totalPages,
  };
}
