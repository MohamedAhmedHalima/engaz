class PoliciesModel {
  String? message;
  bool? status;
  List<PoliciesData>? data;

  PoliciesModel({this.message, this.status, this.data});

  PoliciesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <PoliciesData>[];
      json['data'].forEach((v) {
        data!.add(PoliciesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PoliciesData {
  int? id;
  String? name;
  String? description;
  String? minimumLimit;
  String? createdAt;
  String? updatedAt;

  PoliciesData(
      {this.id,
        this.name,
        this.description,
        this.minimumLimit,
        this.createdAt,
        this.updatedAt});

  PoliciesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    minimumLimit = json['minimum_limit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['minimum_limit'] = minimumLimit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
