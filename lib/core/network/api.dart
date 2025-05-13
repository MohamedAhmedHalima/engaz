import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://order.webbing-agency.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData({
    required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
    return await dio?.get(url!, queryParameters: query, data: data);
  }

  static Future<Response ?> postData ({
    required String? url,
    Map<String, dynamic>? query,
    FormData ? formData,
    Map<String, dynamic>? data,
    String? token,
    Options? options,
  }) async {
    try {
      if (dio == null) {
        throw Exception('Dio is not initialized');
      }
      final mergedOptions = options ?? Options();

      // لا تضيف التوكن إذا كان غير موجود
      if (token != null) {
        mergedOptions.headers = {
          ...?mergedOptions.headers,
          'Authorization': 'Bearer $token',
        };
      }

      print('Sending data to $url with token $token');
      print('Data: $data');

      Response response = await dio!.post(
        url!,
        queryParameters: query,
        data: data??formData,
        options: mergedOptions,
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      return response;
    } catch (e) {
      if (e is DioException) {
        print("❌ Dio Error: ${e.message}");
        print("❌ Status Code: ${e.response?.statusCode}");
        print("❌ Response Data: ${e.response?.data}");

        // لو فيه body راجع حتى مع 400
        if (e.response?.statusCode == 400 && e.response?.data != null) {
          try {
            // ممكن ترجع الموديل أو تستخدمه في الـ state
            return  e.response!;
          } catch (jsonError) {
            print("خطأ في تحويل JSON: $jsonError");
          }
        }
      }

      print("حدث خطأ غير متوقع: $e");
      return null;
    }
  }

  static Future<Response?> postImageData({
    required String? url,
    Map<String, dynamic>? query,
    required FormData data,
    String? token,
  }) async {
    try {
      if (dio == null) {
        throw Exception('Dio is not initialized');
      }

      // Set default headers
      dio?.options.headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': '*/*',
      };

      // Add token if available
      if (token != null && token.isNotEmpty) {
        dio?.options.headers['Authorization'] = 'Bearer $token';
      }

      print('Sending image data to $url with token $token');
      print('Data: $data');

      Response response = await dio!.post(
        url!,
        queryParameters: query,
        data: data,
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }

  static Future<Response?> deleteData({
    required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
    Options? options,
  }) async {
    try {
      if (dio == null) {
        throw Exception('Dio is not initialized');
      }
      final mergedOptions = options ?? Options();

      // لا تضيف التوكن إذا كان غير موجود
      if (token != null) {
        mergedOptions.headers = {
          ...?mergedOptions.headers,
          'Authorization': 'Bearer $token',
        };
      }

      print('Sending DELETE request to $url with token $token');
      print('Data: $data');
      Response response = await dio!.delete(
        url!,
        queryParameters: query,
        data: data,
        options: mergedOptions,
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }
}
