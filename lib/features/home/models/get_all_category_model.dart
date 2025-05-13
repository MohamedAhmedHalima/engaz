class GetAllCategoryModel {
  GetAllCategoryModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final bool? status;
  final Data? data;

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json){
    return GetAllCategoryModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.data,
    required this.pagination,
  });

  final List<DataCategory> data;
  final Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<DataCategory>.from(json["data"]!.map((x) => DataCategory.fromJson(x))),
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x?.toJson()).toList(),
    "pagination": pagination?.toJson(),
  };

}

class DataCategory {
  DataCategory({
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
  final List<DataCategory> subcategories;

  factory DataCategory.fromJson(Map<String, dynamic> json){
    return DataCategory(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      subcategories: json["subcategories"] == null ? [] : List<DataCategory>.from(json["subcategories"]!.map((x) => DataCategory.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "subcategories": subcategories.map((x) => x?.toJson()).toList(),
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

  factory Pagination.fromJson(Map<String, dynamic> json){
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
