// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:taj/application/infrastructure/home/datasource/surah_remote_data_source.dart'
    as _i4;
import 'package:taj/core/di/register_module.dart' as _i5;
import 'package:taj/core/network/dio_module.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.DioModule>(() => registerModule.baseHttpClient);
  gh.lazySingleton<_i4.SurahRemoteDataSource>(
      () => _i4.SurahRemoteDataSourceImpl());
  return getIt;
}

class _$RegisterModule extends _i5.RegisterModule {}
