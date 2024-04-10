import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {


  static Dio _dio = Dio();

  static void configureDio() {
    // Base Api Url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Header config 
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };

  }

  static Future httpGet( String path ) async {
    try {
      final response = await _dio.get(path);
    
      return response.data;
    } catch (e) {
        throw('Error in GET');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
    
      return response.data;
    } catch (e) {
        throw('Error in POST');
    }
  }



}