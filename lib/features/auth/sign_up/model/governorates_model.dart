class GovernoratesModel {
  String? message;
  bool? status;
  List<GovernoratesData>? data;

  GovernoratesModel({this.message, this.status, this.data});

  GovernoratesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <GovernoratesData>[];
      json['data'].forEach((v) {
        data!.add(GovernoratesData.fromJson(v));
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

class GovernoratesData {
  int? id;
  int? governorateId;
  String? nameAr;
  double? longitude;
  double? latitude;
  String? createdAt;
  String? updatedAt;

  GovernoratesData(
      {this.id,
        this.governorateId,
        this.nameAr,
        this.longitude,
        this.latitude,
        this.createdAt,
        this.updatedAt});

  GovernoratesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    nameAr = json['name_ar'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['governorate_id'] = governorateId;
    data['name_ar'] = nameAr;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
