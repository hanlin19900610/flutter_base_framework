import 'package:flutter_base_framework/flutter_base_framework.dart';
import 'dart:convert';

class LogsInterceptors extends InterceptorsWrapper {
  String _tag = 'HttpLog';

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler,) async {
    LogUtil.e("****************onRequest() start*******************", tag: _tag);
    LogUtil.e('url：${options.baseUrl + options.path}', tag: _tag, );
    LogUtil.e('headers: ${json.encode(options.headers)}', tag: _tag, );
    LogUtil.e('method: ${options.method}', tag: _tag, );
    LogUtil.e('responseType: ${options.responseType.toString()}', tag: _tag, );
    LogUtil.e('followRedirects: ${options.followRedirects}', tag: _tag, );
    LogUtil.e('connectTimeout: ${options.connectTimeout}', tag: _tag, );
    LogUtil.e('receiveTimeout: ${options.receiveTimeout}', tag: _tag, );
    LogUtil.e('extra: ${json.encode(options.extra)}', tag: _tag, );
    LogUtil.e('queryParameters: ${json.encode(options.queryParameters)}', tag: _tag, );
    LogUtil.e('params: ${json.encode(options.data ?? {})}', tag: _tag, );
    LogUtil.e("****************onRequest() end*********************", tag: _tag, );
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler,) async {
    LogUtil.e( "****************onResponse() start******************", tag: _tag,);
    _printResponse(response);
    LogUtil.e("****************onResponse() end********************", tag: _tag,);
   handler.next(response);
  }

  void _printResponse(Response response) {
    LogUtil.e( 'url: ${response.requestOptions.path}', tag: _tag,);
    LogUtil.e( 'statusCode: ${response.statusCode}', tag: _tag,);
    if (response.isRedirect == true) {
      LogUtil.e( 'redirect: ${response.realUri}', tag: _tag,);
    }
    LogUtil.e( 'response headers: ${response.headers.toString()}', tag: _tag,);
    LogUtil.e( 'Response Text: ${response.toString()}', tag: _tag,);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler,) async {
    LogUtil.e( "****************onError() start*********************", tag: _tag,);
    LogUtil.e( '请求异常: ${err.toString()}', tag: _tag,);
    LogUtil.e( '请求异常信息: ${err.response?.toString()}', tag: _tag,);
    LogUtil.e( "****************onError() end***********************", tag: _tag,);
    handler.next(err);
  }
}