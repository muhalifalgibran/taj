import 'package:dartz/dartz.dart';
import 'package:taj/application/domain/entity/home/surah.dart';
import 'package:taj/core/error/failures.dart';

abstract class SurahRemoteDataSource {
  Future<Either<Failure, Surah>> getSurah();
}

class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  // final client =
  @override
  Future<Either<Failure, Surah>> getSurah() {
    // TODO: implement getSurah
    throw UnimplementedError();
  }
}
