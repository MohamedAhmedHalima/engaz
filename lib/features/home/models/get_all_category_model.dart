// get_all_category_model.dart

class GetAllCategoryModel {
  final String? message;
  final bool? status;
  final Data? data;

  GetAllCategoryModel({
    this.message,
    this.status,
    this.data,
  });

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoryModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final List<DataCategory>? data;
  final Pagination? pagination;

  Data({
    this.data,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => DataCategory.fromJson(item as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

class DataCategory {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final List<DataCategory>? subcategories;

  DataCategory({
    this.id,
    this.name,
    this.description,
    this.image,
    this.subcategories,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) {
    return DataCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((item) => DataCategory.fromJson(item as Map<String, dynamic>))
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

class Pagination {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final int? totalPages;

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

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
      'total_pages': totalPages,
    };
  }
}
