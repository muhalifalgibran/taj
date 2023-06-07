import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioModule with DioMixin implements Dio {
  DioModule._() {
    options = BaseOptions(
      baseUrl: 'http://api.alquran.cloud/v1',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    httpClientAdapter = IOHttpClientAdapter();
  }

  Dio get dioV1 => DioModule.init();

  /* Instance Getter */
  static DioModule init() {
    print('this is get called');
    return DioModule._();
  }
}
