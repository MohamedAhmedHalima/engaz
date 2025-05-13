import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/login/model/login_model.dart';
import '../../features/auth/sign_up/model/sign_up_model.dart';

class SharedPreferencesHelper {
  static const _userTokenKey = 'user_token';
  static const fcmToken = 'Fcm_Token';
  static  UserData ? userModel;
  static const String _cachedCategoriesKey = "CACHED_CATEGORIES";
  static const String _cachedSubCategoriesKey = "CACHED_Sub_CATEGORIES";
  static const _imageUrlKey = 'profile_image_url';

  static Future<void> saveCategories(List<dynamic> categories) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(categories);
    await prefs.setString(_cachedCategoriesKey, data);
  }

  static Future<void> saveSubCategories(List<dynamic> subcategories) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(subcategories);
    await prefs.setString(_cachedSubCategoriesKey, data);
  }

  static Future<List<dynamic>?> getSUbCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cachedSubCategoriesKey);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  static Future<List<dynamic>?> getCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cachedCategoriesKey);
    if (data != null) {
      return jsonDecode(data); // Convert back to List
    }
    return null;
  }

  static Future<void> saveProfileImageUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageUrlKey, url); // Use consistent key
  }

  static Future<String?> getProfileImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageUrlKey); // Use consistent key
  }

  static Future<bool> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_userTokenKey, token);
    } catch (e) {
      print("Error saving token: $e");
      return false;
    }
  }
  static Future<UserData?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("user");
    if (result != null) {
      userModel = UserData.fromJson(const JsonDecoder().convert(result));
      return userModel;
    }
    return null;
  }

  static Future<void> saveUser(UserData? user) async {
    userModel = user;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", const JsonCodec().encode(userModel!.toJson()));
  }

  // static Future<void> deleteUser() async {
  //   if(accessToken!=null){
  //     // await FirebaseMessaging.instance.unsubscribeFromTopic(accessToken!);
  //   }
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('user');
  //   accessToken="";
  //   refreshToken="";
  //   userModel=UserModel();
  //   await prefs.clear();
  // }
  static Future<bool> saveFcmToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(fcmToken, token);
    } catch (e) {
      print("Error saving token: $e");
      return false;
    }
  }

  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_userTokenKey);
    } catch (e) {
      print("Error getting token: $e");
      return null;
    }
  }

  static Future<dynamic?> getFcmToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(fcmToken);
    } catch (e) {
      print("Error getting token: $e");
      return null;
    }
  }

  static Future<bool> removeToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove("token");
    } catch (e) {
      print("Error removing token: $e");
      return false;
    }
  }

  static Future<bool> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.clear();
    } catch (e) {
      print("Error clearing SharedPreferences: $e");
      return false;
    }
  }

  static Future<void> printToken() async {
    String? token = await getToken();
    if (token != null) {
      print('Token: $token');
    } else {
      print('No token found.');
    }
  }
}
