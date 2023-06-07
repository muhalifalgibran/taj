import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:taj/core/network/dio_module.dart';

@module
abstract class RegisterModule {
  DioModule get baseHttpClient => DioModule.init();
}
