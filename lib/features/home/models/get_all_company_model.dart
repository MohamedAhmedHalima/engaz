class GetAllCompanyModel {
  final String? message;
  final bool? status;
  final CompanyData? data;

  GetAllCompanyModel({
    this.message,
    this.status,
    this.data,
  });

  factory GetAllCompanyModel.fromJson(Map<String, dynamic> json) {
    return GetAllCompanyModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] != null
          ? CompanyData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (status != null) 'status': status,
    if (data != null) 'data': data!.toJson(),
  };
}

class CompanyData {
  final List<Company>? data;
  final Pagination? pagination;

  CompanyData({
    this.data,
    this.pagination,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data!.map((c) => c.toJson()).toList(),
    if (pagination != null) 'pagination': pagination!.toJson(),
  };
}

class Company {
  final int? id;
  final String? name;
  final String? logo;

  Company({
    this.id,
    this.name,
    this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (name != null) 'name': name,
    if (logo != null) 'logo': logo,
  };
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

  Map<String, dynamic> toJson() => {
    if (total != null) 'total': total,
    if (count != null) 'count': count,
    if (perPage != null) 'per_page': perPage,
    if (currentPage != null) 'current_page': currentPage,
    if (lastPage != null) 'last_page': lastPage,
    if (totalPages != null) 'total_pages': totalPages,
  };
}
