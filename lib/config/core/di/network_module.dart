import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testt/config/clients/api_client.dart';
import 'package:testt/config/core/di/injection.dart';

@module
abstract class NetWorkModule{
@Named("unprotectedroutes")
@LazySingleton()
Dio get unprotectedClient=>ApiClient.getStandardClient();

@LazySingleton()
ApiClient get apiClient=> ApiClient();

@Named("protectedroutes")
@LazySingleton()
Dio get authClient=>getIt<ApiClient>().dio;
}