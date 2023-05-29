import 'dart:io';

import 'package:dio/dio.dart';

class DioModule with DioMixin implements Dio {
  DioModule._() {
    options = BaseOptions(
      baseUrl: 'http://api.alquran.cloud/v1',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  Dio get dio => DioModule.init();

  /* Instance Getter */
  static DioModule init() {
    return DioModule._();
  }
}
