class CartModel {
  final String? message;
  final bool? status;
  final List<CartItem>? data;

  CartModel({
    this.message,
    this.status,
    this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null
          ? List<CartItem>.from(json['data'].map((x) => CartItem.fromJson(x)))
          : null,
    );
  }
}

class CartItem {
  final int? id;
  final int? userId;
  final int? productId;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CartProduct? product;

  CartItem({
    this.id,
    this.userId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      product: json['product'] != null ? CartProduct.fromJson(json['product']) : null,
    );
  }
}

class CartProduct {
  final int? id;
  final String? type;
  final String? name;
  final String? serviceTracking;
  final String? reference;
  final String? barcode;
  final double? price;
  final double? cost;
  final double? volume;
  final double? weight;
  final String? description;
  final String? descriptionPurchase;
  final String? descriptionSale;
  final bool? enableSales;
  final bool? enablePurchase;
  final bool? isFavorite;
  final bool? isConfigurable;
  final int? sort;
  final List<String>? images;
  final int? parentId;
  final int? uomId;
  final int? uomPoId;
  final int? categoryId;
  final int? companyId;
  final int? creatorId;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? saleDelay;
  final String? tracking;
  final String? descriptionPicking;
  final String? descriptionPickingOut;
  final String? descriptionPickingIn;
  final bool? isStorable;
  final int? expirationTime;
  final int? useTime;
  final int? removalTime;
  final int? alertTime;
  final int? useExpirationDate;
  final int? responsibleId;
  final int? propertyAccountIncomeId;
  final int? propertyAccountExpenseId;
  final String? image;
  final String? serviceType;
  final String? saleLineWarn;
  final String? expensePolicy;
  final String? invoicePolicy;
  final bool? salesOk;
  final bool? purchaseOk;
  final String? saleLineWarnMsg;
  final int? limit;
  final int? discount;

  CartProduct({
    this.id,
    this.type,
    this.name,
    this.serviceTracking,
    this.reference,
    this.barcode,
    this.price,
    this.cost,
    this.volume,
    this.weight,
    this.description,
    this.descriptionPurchase,
    this.descriptionSale,
    this.enableSales,
    this.enablePurchase,
    this.isFavorite,
    this.isConfigurable,
    this.sort,
    this.images,
    this.parentId,
    this.uomId,
    this.uomPoId,
    this.categoryId,
    this.companyId,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.saleDelay,
    this.tracking,
    this.descriptionPicking,
    this.descriptionPickingOut,
    this.descriptionPickingIn,
    this.isStorable,
    this.expirationTime,
    this.useTime,
    this.removalTime,
    this.alertTime,
    this.useExpirationDate,
    this.responsibleId,
    this.propertyAccountIncomeId,
    this.propertyAccountExpenseId,
    this.image,
    this.serviceType,
    this.saleLineWarn,
    this.expensePolicy,
    this.invoicePolicy,
    this.salesOk,
    this.purchaseOk,
    this.saleLineWarnMsg,
    this.limit,
    this.discount,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      serviceTracking: json['service_tracking'],
      reference: json['reference'],
      barcode: json['barcode'],
      price: (json['price'] as num?)?.toDouble(),
      cost: (json['cost'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      description: json['description'],
      descriptionPurchase: json['description_purchase'],
      descriptionSale: json['description_sale'],
      enableSales: json['enable_sales'],
      enablePurchase: json['enable_purchase'],
      isFavorite: json['is_favorite'],
      isConfigurable: json['is_configurable'],
      sort: json['sort'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      parentId: json['parent_id'],
      uomId: json['uom_id'],
      uomPoId: json['uom_po_id'],
      categoryId: json['category_id'],
      companyId: json['company_id'],
      creatorId: json['creator_id'],
      deletedAt: json['deleted_at'] != null ? DateTime.tryParse(json['deleted_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      saleDelay: json['sale_delay'],
      tracking: json['tracking'],
      descriptionPicking: json['description_picking'],
      descriptionPickingOut: json['description_pickingout'],
      descriptionPickingIn: json['description_pickingin'],
      isStorable: json['is_storable'] == 1,
      expirationTime: json['expiration_time'],
      useTime: json['use_time'],
      removalTime: json['removal_time'],
      alertTime: json['alert_time'],
      useExpirationDate: json['use_expiration_date'],
      responsibleId: json['responsible_id'],
      propertyAccountIncomeId: json['property_account_income_id'],
      propertyAccountExpenseId: json['property_account_expense_id'],
      image: json['image'],
      serviceType: json['service_type'],
      saleLineWarn: json['sale_line_warn'],
      expensePolicy: json['expense_policy'],
      invoicePolicy: json['invoice_policy'],
      salesOk: json['sales_ok'] == 1,
      purchaseOk: json['purchase_ok'] == 1,
      saleLineWarnMsg: json['sale_line_warn_msg'],
      limit: json['limit'],
      discount: json['discount'],
    );
  }
}
