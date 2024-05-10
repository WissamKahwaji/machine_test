// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'data/core/utils/network/configuration.dart' as _i3;
import 'data/core/utils/network/network_info.dart' as _i8;
import 'data/location/datasources/location_remote_data_source.dart' as _i6;
import 'data/location/repositories/location_repositories_impl.dart' as _i10;
import 'domain/core/utils/network/network_info.dart' as _i7;
import 'domain/location/repositories/location_repositories.dart' as _i9;
import 'domain/location/usecases/get_place_id_use_case.dart' as _i11;
import 'domain/location/usecases/get_place_use_case.dart' as _i12;
import 'injectable_module.dart' as _i14;
import 'presentation/location_map/blocs/location_bloc/location_bloc_bloc.dart'
    as _i13;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Configuration>(
      () => _i3.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i5.InternetConnectionChecker>(
        () => injectableModule.connectionChecker);
    gh.lazySingleton<_i6.LocationRemoteDataSource>(
        () => _i6.LocationRemoteDataSourceImpl(
              gh<_i4.Dio>(),
              gh<_i3.Configuration>(),
            ));
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i8.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.lazySingleton<_i9.LocationRepository>(() => _i10.LocationRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          locationRemoteDataSource: gh<_i6.LocationRemoteDataSource>(),
        ));
    gh.lazySingleton<_i11.GetPlaceIdUseCase>(() => _i11.GetPlaceIdUseCase(
        locationRepository: gh<_i9.LocationRepository>()));
    gh.lazySingleton<_i12.GetPlaceUseCase>(() =>
        _i12.GetPlaceUseCase(locationRepository: gh<_i9.LocationRepository>()));
    gh.factory<_i13.LocationBlocBloc>(() => _i13.LocationBlocBloc(
          getPlaceIdUseCase: gh<_i11.GetPlaceIdUseCase>(),
          getPlaceUseCase: gh<_i12.GetPlaceUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i14.InjectableModule {}
