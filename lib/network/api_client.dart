import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/db/local_db.dart';
import 'package:mobile/network/services/common_service.dart';

import '../constants/urls_const.dart';
import '../resources/toast.dart';
import '../routes/navigation_service.dart';

class ApiClient {
  late Dio dio;

  final String path;
  final bool loader;
  final bool errToast;

  final Map<String, String>? additionalHeaders;

  ApiClient(this.path, {this.loader=true, this.errToast=true,this.additionalHeaders, String? baseUrl}){
    dio = Dio();
    dio.options.baseUrl = baseUrl ?? UrlsConst.apiHost;
    dio.interceptors.add(ApiInterceptors(
      dio: dio, 
      additionalHeaders: additionalHeaders,
      loader: loader,
      errToast: errToast
    ));
  }

  Future<dynamic> gets({Map<String, dynamic>? query}) async {
    return _process(await dio.get<Map>(path, queryParameters: query));
  }

  Future<dynamic> post({dynamic data = const {}, Map<String, dynamic>? query}) async {
    return _process(await dio.post<Map>(path, data: data));
  }

  Future<dynamic> put({dynamic data = const {}, Map<String, dynamic>? query}) async {
    return _process(await dio.put<Map>(path, data: data));
  }

  Future<dynamic> delete({dynamic data = const {}, Map<String, dynamic>? query}) async {
    return _process(await dio.delete<Map>(path, data: data));
  }

  _process(Response response){
    return response.data['data'];
  }
}

class ApiInterceptors extends Interceptor {
  final Dio dio;
  final Map<String, String>? additionalHeaders;
  final bool loader;
  final bool errToast;

  ApiInterceptors({
    required this.dio,
    required this.additionalHeaders,
    required this.errToast,
    required this.loader  
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    if (loader) showLoader();
    
    options.headers["Content-Type"] = "application/json";
    var accessToken = LocalDB.getAccessToken();
    if(accessToken!=null){
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    if (additionalHeaders != null){
      for (var element in additionalHeaders!.keys) { 
        options.headers[element] = additionalHeaders![element];
      }
    }

    return handler.next(options);
  }

  bool isRefreshing = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if (loader) hideLoader();
    
    if(err.response?.statusCode==401){
      var data = await CommonService().getToken();
      LocalDB.saveAccessToken(data['accessToken']);
      LocalDB.saveRefreshToken(data['newRefreshToken']);
      try {
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      } finally {
        isRefreshing = false;
      }
    } 

    if (err.response?.data is Map && err.response!.data.containsKey('message')) {
      if (errToast) toast(err.response?.data['message'].toString(), success: false);
    } else {
      if (errToast) toast('Something went wrong !', success: false);
    }

    if(err.response?.statusCode==401){
      return;
    }else {
      return handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    if (loader) hideLoader();

    if(response.data!=null){

      if(response.data['status']=='success'){
        var data = response.data['data'];

        if(data == 'logout'){
          LocalDB.clearDB();
          Navigator.of(NavigationService.navigatorKey.currentContext!).popUntil((route) => false);
          return;
        }

        if(data!=null && data is Map){
          if(data['accessToken']!=null){
            LocalDB.saveAccessToken(data['accessToken']);
          }
          if(data['refreshToken']!=null){
            LocalDB.saveRefreshToken(data['refreshToken']);
          }
        }

        return handler.next(response);
      }
    }
  }

}