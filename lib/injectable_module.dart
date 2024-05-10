import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'clientTZ': 'Asia/Dubai',
          },
          validateStatus: (statusCode) {
            if (statusCode != null) {
              if (200 <= statusCode && statusCode < 300) {
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          }),
    );

    dio.interceptors.add(
      LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (obj) {
            debugPrint(obj.toString());
          }),
    );
    return dio;
  }
}
