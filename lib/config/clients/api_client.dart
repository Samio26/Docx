
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:testt/config/core/local_storage.dart';

class ApiClient{

final Dio dio=getStandardClient();
ApiClient(){
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler)async {
         String? accessToken=await getFromSecureStorage<String>("accessToken");
        options.headers[HttpHeaders.authorizationHeader]="Bearer $accessToken";
      },
     
    )
  );
}

  static Dio getStandardClient(){
    final dio=Dio(
      BaseOptions(
        baseUrl: "http://localhost:3001",
        headers: {
          HttpHeaders.contentTypeHeader:"application/json",
          HttpHeaders.acceptHeader:"application/json",
        },
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5)
      )
    );

  if(kDebugMode){
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              error: true,
    ));
  }
    return dio;
  }
}