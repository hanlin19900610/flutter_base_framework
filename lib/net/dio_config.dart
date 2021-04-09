import 'package:flutter_base_framework/flutter_base_framework.dart';


class DioConfig {
  String? _baseUrl;
  String? get baseUrl => _baseUrl;

  String? _proxy;
  String? get proxy => _proxy;

  String? _cookiesPath;
  String? get cookiesPath => _cookiesPath;

  /// 请求的contentType
  String? _contentType;
  String? get contentType => _contentType;

  List<Interceptor>? _interceptors;

  List<Interceptor>? get interceptors => _interceptors;

  init(String baseUrl, {List<Interceptor>? interceptors, String? proxy, String? cookiesPath, String contentType = Headers.formUrlEncodedContentType}) {
    _baseUrl = baseUrl;
    _interceptors = interceptors;
    _proxy = proxy;
    _cookiesPath = cookiesPath;
    _contentType = contentType;
  }

  static DioConfig of() => Get.find<DioConfig>();
}
