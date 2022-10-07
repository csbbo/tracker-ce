import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:tracker/common/utils/pref_utils.dart';

typedef Success = void Function(dynamic json);
typedef Fail = void Function(String reason, int code);
typedef After = void Function();

class Http {
  static Dio? _dio;
  static const String _host = "http://192.168.110.25:8000";

  Http() {
    _dio ??= createDio();
  }

  Dio createDio() {
    var dio = Dio(
        BaseOptions(
          connectTimeout: 30000,
          receiveTimeout: 30000,
          sendTimeout: 30000,
          responseType: ResponseType.json,
          headers: {
            "Content-Type": "application/json",
            // "Authorization": "Token $token"
          }
      )
    );
    dio.interceptors.add(DioLogInterceptor());

    return dio;
  }

  Future<void> get(String uri, Map<String, dynamic> params, {Success? success, Fail? fail, After? after}) {
    var token = UserPreferences.getToken();
    _dio?.options.headers["Authorization"] = "Token $token";

    _dio?.get("$_host$uri", queryParameters: params).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage!, response.statusCode!);
        }
      }

      if (after != null) {
        after();
      }
    });
    return Future.value();
  }

  Future<void> post(String uri, data, {params, Success? success, Fail? fail, After? after}) {
    // todo: createDio似乎只会执行一次，所以需要每次发请求钱获取一次最新token
    var token = UserPreferences.getToken();
    _dio?.options.headers["Authorization"] = "Token $token";

    _dio?.post("$_host$uri", data: data, queryParameters: params).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage!, response.statusCode!);
        }
      }

      if (after != null) {
        after();
      }
    });
    return Future.value();
  }

  Future<void> delete(String uri, data, {params, Success? success, Fail? fail, After? after}) {
    _dio?.delete(uri, data: data, queryParameters: params).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage!, response.statusCode!);
        }
      }

      if (after != null) {
        after();
      }
    });
    return Future.value();
  }
}
