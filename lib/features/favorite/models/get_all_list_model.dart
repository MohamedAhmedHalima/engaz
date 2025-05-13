class FavouriteListModel {
  final String? message;
  final bool? status;
  final List<FavouriteItem>? data;

  FavouriteListModel({
    this.message,
    this.status,
    this.data,
  });

  factory FavouriteListModel.fromJson(Map<String, dynamic> json) {
    return FavouriteListModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null
          ? List<FavouriteItem>.from(
        json['data'].map((x) => FavouriteItem.fromJson(x)),
      )
          : null,
    );
  }
}

class FavouriteItem {
  final int? id;
  final String? type;
  final String? name;
  final String? serviceTracking;
  final double? price;
  final double? cost;
  final double? volume;
  final double? weight;
  final String? description;
  final List<String>? images;
  final int? uomId;
  final int? uomPoId;
  final int? categoryId;
  final int? companyId;
  final int? creatorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? saleDelay;
  final String? tracking;
  final bool? isStorable;
  final int? expirationTime;
  final int? useTime;
  final int? removalTime;
  final int? alertTime;
  final int? useExpirationDate;
  final int? responsibleId;
  final bool? salesOk;
  final bool? purchaseOk;
  final int? limit;
  final int? discount;
  final Pivot? pivot;

  FavouriteItem({
    this.id,
    this.type,
    this.name,
    this.serviceTracking,
    this.price,
    this.cost,
    this.volume,
    this.weight,
    this.description,
    this.images,
    this.uomId,
    this.uomPoId,
    this.categoryId,
    this.companyId,
    this.creatorId,
    this.createdAt,
    this.updatedAt,
    this.saleDelay,
    this.tracking,
    this.isStorable,
    this.expirationTime,
    this.useTime,
    this.removalTime,
    this.alertTime,
    this.useExpirationDate,
    this.responsibleId,
    this.salesOk,
    this.purchaseOk,
    this.limit,
    this.discount,
    this.pivot,
  });

  factory FavouriteItem.fromJson(Map<String, dynamic> json) {
    return FavouriteItem(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      serviceTracking: json['service_tracking'],
      price: (json['price'] as num?)?.toDouble(),
      cost: (json['cost'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      description: json['description'],
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : null,
      uomId: json['uom_id'],
      uomPoId: json['uom_po_id'],
      categoryId: json['category_id'],
      companyId: json['company_id'],
      creatorId: json['creator_id'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      saleDelay: json['sale_delay'],
      tracking: json['tracking'],
      isStorable: json['is_storable'] != null
          ? json['is_storable'] == 1
          : null,
      expirationTime: json['expiration_time'],
      useTime: json['use_time'],
      removalTime: json['removal_time'],
      alertTime: json['alert_time'],
      useExpirationDate: json['use_expiration_date'],
      responsibleId: json['responsible_id'],
      salesOk: json['sales_ok'] != null ? json['sales_ok'] == 1 : null,
      purchaseOk: json['purchase_ok'] != null ? json['purchase_ok'] == 1 : null,
      limit: json['limit'],
      discount: json['discount'],
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }
}

class Pivot {
  final int? userId;
  final int? productId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Pivot({
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      productId: json['product_id'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
