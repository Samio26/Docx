
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
 final Dio _client;

 const AuthRemoteDataSource(@Named("unprotectedroutes") Dio client):_client=client;

 Future<String> login(String email,String password)async{
  final response=await _client.post("/api/v1/login",data: {
    "email":email,
    "password":password
  });
  if(response.statusCode.toString().startsWith("2")){
    return jsonDecode(response.data);
  }else{
    throw Exception(response.statusMessage);
  }
 }
}