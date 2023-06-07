import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:taj/application/domain/entity/home/surah.dart';
import 'package:taj/core/di/register_module.dart';
import 'package:taj/core/di/service_locator.dart';
import 'package:taj/core/error/failures.dart';
import 'package:taj/core/network/dio_module.dart';

abstract class SurahRemoteDataSource {
  Future<Surah> getSurah();
}

@LazySingleton(as: SurahRemoteDataSource)
class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  final httpModule = getIt<DioModule>();
  @override
  Future<Surah> getSurah() async {
    final result = await httpModule.dioV1
        .get('http://api.alquran.cloud/v1/ayah/262/en.asad');

    print('hasilnya ${result.data}');
    return Surah(code: 400, status: 'ss', data: null);
  }
}
