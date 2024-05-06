import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:james_shop/core/helper/helper.dart';
import 'package:james_shop/core/network/logger_interceptor.dart';
import 'package:james_shop/core/utils/constant/network_constant.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/core/utils/log/app_logger.dart';
import 'package:james_shop/core/utils/log/logger.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

class DioNetwork {
  static Dio dio = Dio();

  static void initDio() {
    final dio = Dio(baseOptions(NetworkConstant.apiUrl));
    dio.interceptors.add(loggerInterceptor());
    dio.interceptors.add(appQueuedInterceptorsWrapper());
  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///

  /// App Api Queued Interceptor
  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getHeaders();

        final token = sl<AppSharedPrefs>().getUser()?.token ?? "";

        if (token.isEmpty) {
          options.headers.addAll(Helper.headerAfterLogin);
        } else {
          options.headers.addAll(Helper.header);
        }

        if (kDebugMode) {
          print("Headers");
          print(json.encode(headers));
        }
        options.headers = headers;
        dio.options.headers = headers;

        final method = options.method;
        final uri = options.uri;
        final data = options.data;

        apiLogger.log(
            "\n\n--------------------------------------------------------------------------------------------------------");
        if (method == 'GET') {
          apiLogger.log(
              "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
              printFullText: true);
        } else {
          try {
            apiLogger.log(
                "✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: ${jsonEncode(data)}",
                printFullText: true);
          } catch (e) {
            apiLogger.log(
                "✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: $data",
                printFullText: true);
          }
        }

        return r.next(options);
      },
      onError: (error, handler) async {
        final statusCode = error.response?.statusCode;
        final uri = error.requestOptions.path;
        var data = "";
        try {
          data = jsonEncode(error.response?.data);
        } catch (e) {
          apiLogger.e(e);
        }
        apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) async {
        final statusCode = response.statusCode;
        final uri = response.requestOptions.uri;
        final data = jsonEncode(response.data);

        apiLogger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");

        return handler.next(response);
      },
    );
  }

  /// App interceptor
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = Helper.getHeaders();

        options.headers = headers;
        dio.options.headers = headers;

        return r.next(options);
      },
      onResponse: (response, handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
          // return handler.reject(DioError(requestOptions: response.requestOptions, response: response, error: response, type: DioErrorType.response));
        } else {
          return handler.next(response);
        }
      },
      onError: (error, handler) {
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
    );
  }

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
