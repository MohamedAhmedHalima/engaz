class UserData {
  final int? id;
  final String? name;
  final String? role;
  final bool? isActive;
  final String? marketName;
  final String? activityType;
  final int? firstPhone;
  final int? secondPhone;
  final Governorate? governorate;
  final City? city;
  final County? county;
  final List<String>? images;
  final double? lat;
  final double? long;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserData({
    this.id,
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
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      isActive: json['is_active'] as bool?,
      marketName: json['market_name'] as String?,
      activityType: json['activity_type'] as String?,
      firstPhone: json['first_phone'] as int?,
      secondPhone: json['second_phone'] as int?,
      governorate: json['governorate'] != null
          ? Governorate.fromJson(json['governorate'] as Map<String, dynamic>)
          : null,
      city: json['city'] != null
          ? City.fromJson(json['city'] as Map<String, dynamic>)
          : null,
      county: json['county'] != null
          ? County.fromJson(json['county'] as Map<String, dynamic>)
          : null,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'is_active': isActive,
      'market_name': marketName,
      'activity_type': activityType,
      'first_phone': firstPhone,
      'second_phone': secondPhone,
      'governorate': governorate?.toJson(),
      'city': city?.toJson(),
      'county': county?.toJson(),
      'images': images,
      'lat': lat,
      'long': long,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class Governorate {
  final int? id;
  final String? nameAr;
  final double? longitude;
  final double? latitude;

  Governorate({
    this.id,
    this.nameAr,
    this.longitude,
    this.latitude,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

class City {
  final int? id;
  final String? nameAr;
  final double? longitude;
  final double? latitude;
  final int? governorateId;

  City({
    this.id,
    this.nameAr,
    this.longitude,
    this.latitude,
    this.governorateId,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      governorateId: json['governorate_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'longitude': longitude,
      'latitude': latitude,
      'governorate_id': governorateId,
    };
  }
}

class County {
  final int? id;
  final String? nameAr;
  final double? longitude;
  final double? latitude;
  final int? cityId;

  County({
    this.id,
    this.nameAr,
    this.longitude,
    this.latitude,
    this.cityId,
  });

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      cityId: json['city_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'longitude': longitude,
      'latitude': latitude,
      'city_id': cityId,
    };
  }
}
