import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_framework/flutter_base_framework.dart';


const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultSendTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class AppDio with DioMixin implements Dio {
  DioConfig _dioConfig = DioConfig.of();
  AppDio._([BaseOptions? options]) {
    options ??= BaseOptions(
      baseUrl: _dioConfig.baseUrl!,
      contentType: _dioConfig.contentType,
      connectTimeout: _defaultConnectTimeout,
      sendTimeout: _defaultSendTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    );

    this.options = options;

    if (kDebugMode) {
      interceptors.add(LogsInterceptors());
    }
    if (_dioConfig.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  setProxy(String proxy) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY $proxy";
      };
      // you can also create a HttpClient to dio
      // return HttpClient();
    };
  }

  static Dio getInstance() => AppDio._();
}
