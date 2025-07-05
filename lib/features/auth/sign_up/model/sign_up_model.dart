
import 'governorates_model.dart';

class SignUpModel {
  String? message;
  bool? status;
  UserData? data;

  SignUpModel({this.message, this.status, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? role;
  bool? isActive;
  String? marketName;
  String? activityType;
  String? firstPhone;
  String? secondPhone;
  GovernoratesData? governorate;
  GovernoratesData? city;
  GovernoratesData? county;
  List<String>? images;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.name,
        this.role,
        this.isActive,
        this.marketName,
        this.activityType,
        this.firstPhone,
        this.secondPhone,
        this.governorate,
        this.city,
        this.county,
        this.images,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    isActive = json['is_active'];
    marketName = json['market_name'];
    activityType = json['activity_type'];
    firstPhone = json['first_phone'].toString();
    secondPhone = json['second_phone'].toString();
    governorate = json['governorate'] != null
        ? GovernoratesData.fromJson(json['governorate'])
        : null;
    city = json['city'] != null ? GovernoratesData.fromJson(json['city']) : null;
    county =
    json['county'] != null ? GovernoratesData.fromJson(json['county']) : null;
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['is_active'] = isActive;
    data['market_name'] = marketName;
    data['activity_type'] = activityType;
    data['first_phone'] = firstPhone;
    data['second_phone'] = secondPhone;
    if (governorate != null) {
      data['governorate'] = governorate!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (county != null) {
      data['county'] = county!.toJson();
    }
    data['images'] = images;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Governorate {
  int? id;
  String? nameAr;
  double? longitude;
  double? latitude;
  String? createdAt;
  String? updatedAt;

  Governorate(
      {this.id,
        this.nameAr,
        this.longitude,
        this.latitude,
        this.createdAt,
        this.updatedAt});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class City {
  int? id;
  String? nameAr;
  double? longitude;
  double? latitude;
  int? governorateId;
  String? createdAt;
  String? updatedAt;

  City(
      {this.id,
        this.nameAr,
        this.longitude,
        this.latitude,
        this.governorateId,
        this.createdAt,
        this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    governorateId = json['governorate_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['governorate_id'] = governorateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class County {
  int? id;
  String? nameAr;
  double? longitude;
  double? latitude;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  County(
      {this.id,
        this.nameAr,
        this.longitude,
        this.latitude,
        this.cityId,
        this.createdAt,
        this.updatedAt});

  County.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
