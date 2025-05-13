class HomeOfferModel {
  final String? message;
  final bool? status;
  final OfferData? data;

  HomeOfferModel({
    this.message,
    this.status,
    this.data,
  });

  factory HomeOfferModel.fromJson(Map<String, dynamic> json) {
    return HomeOfferModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null ? OfferData.fromJson(json['data']) : null,
    );
  }
}

class OfferData {
  final List<OfferModel>? data;
  final Pagination? pagination;

  OfferData({
    this.data,
    this.pagination,
  });

  factory OfferData.fromJson(Map<String, dynamic> json) {
    return OfferData(
      data: json['data'] != null
          ? List<OfferModel>.from(json['data'].map((x) => OfferModel.fromJson(x)))
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }
}

class OfferModel {
  final int? id;
  final String? name;
  final double? amount;
  final double? discount;
  final String? image;

  OfferModel({
    this.id,
    this.name,
    this.amount,
    this.discount,
    this.image,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      name: json['name'],
      amount: (json['amount'] != null) ? json['amount'].toDouble() : null,
      discount: (json['discount'] != null) ? json['discount'].toDouble() : null,
      image: json['image'],
    );
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
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      totalPages: json['total_pages'],
    );
  }
}
