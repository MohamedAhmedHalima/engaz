import 'package:dio/dio.dart';

class DioHelper {
  static late final Dio dio;
  //    static String baseUrl = 'https://orderk.shop/api';
  /// يجب استدعاءه مرة واحدة في بداية التطبيق (مثلاً في main)
  static void init() {
    final options = BaseOptions(
      baseUrl: 'https://orderk.shop/api/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      headers: {
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        // تعامل مع جميع الكودات < 500 كـ نجاح، و 500+ كخطأ
        return status != null && status < 500;
      },
    );

    dio = Dio(options)
      ..interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          logPrint: (obj) => print(obj),
        ),
      );
  }

  /// GET request
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,Map<String, dynamic>? data,
  }) async {
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await dio.get(url, queryParameters: query, data: data);
      return response;
    } on DioException catch (e) {
      print('Dio GET Error: ${e.response?.statusCode} ${e.message}');
      return e.response; // لو في body مهم حتى لو كود 400 مثلا
    } catch (e) {
      print('Unexpected GET error: $e');
      return null;
    }
  }

  /// POST request (JSON body or FormData)
  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    FormData? formData,
    String? token,
  }) async {
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: formData ?? data,
      );
      return response;
    } on DioException catch (e) {
      print('Dio POST Error: ${e.response?.statusCode} ${e.message}');
      return e.response;
    } catch (e) {
      print('Unexpected POST error: $e');
      return null;
    }
  }

  /// PUT request
  static Future<Response?> updateData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    FormData? formData,
    String? token,
  }) async {
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await dio.put(
        url,
        queryParameters: query,
        data: formData ?? data,
      );
      return response;
    } on DioException catch (e) {
      print('Dio PUT Error: ${e.response?.statusCode} ${e.message}');
      return e.response;
    } catch (e) {
      print('Unexpected PUT error: $e');
      return null;
    }
  }

  /// DELETE request
  static Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await dio.delete(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      print('Dio DELETE Error: ${e.response?.statusCode} ${e.message}');
      return e.response;
    } catch (e) {
      print('Unexpected DELETE error: $e');
      return null;
    }
  }

  /// POST image (multipart/form-data)
  static Future<Response?> postImageData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers
      ..remove('Content-Type')
      ..addAll({
        'Content-Type': 'multipart/form-data',
      });
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      print('Dio IMAGE POST Error: ${e.response?.statusCode} ${e.message}');
      return e.response;
    } catch (e) {
      print('Unexpected IMAGE POST error: $e');
      return null;
    }
  }
}
