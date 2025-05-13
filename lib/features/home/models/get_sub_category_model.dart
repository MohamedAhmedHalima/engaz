import 'dart:convert';

class SubCategoriesModel {
  final String status;
  final int results;
  final List<SubCategory> subCategories;

  SubCategoriesModel({
    required this.status,
    required this.results,
    required this.subCategories,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      status: json['status'],
      results: json['results'],
      subCategories: (json['subCategories'] as List)
          .map((item) => SubCategory.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
      'subCategories': subCategories.map((item) => item.toJson()).toList(),
    };
  }
}

class SubCategory {
  final String id;
  final String image;
  final String name;
  final Category categoryId;

  SubCategory({
    required this.id,
    required this.image,
    required this.name,
    required this.categoryId,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      categoryId: Category.fromJson(json['categoryId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'name': name,
      'categoryId': categoryId.toJson(),
    };
  }
}

class Category {
  final String id;
  final String image;
  final String name;

  Category({
    required this.id,
    required this.image,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'name': name,
    };
  }
}
