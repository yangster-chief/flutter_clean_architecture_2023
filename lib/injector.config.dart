// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_clean_architecture_2023/datasource/local/local_data_source.dart'
    as _i5;
import 'package:flutter_clean_architecture_2023/datasource/remote/remote_data_source.dart'
    as _i6;
import 'package:flutter_clean_architecture_2023/module/app_module.dart' as _i16;
import 'package:flutter_clean_architecture_2023/module/hive/hive_service.dart'
    as _i4;
import 'package:flutter_clean_architecture_2023/src/data/local/local_data_repository_impl.dart'
    as _i8;
import 'package:flutter_clean_architecture_2023/src/data/remote/remote_data_repository_impl.dart'
    as _i10;
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart'
    as _i7;
import 'package:flutter_clean_architecture_2023/src/domain/remote_data_repository.dart'
    as _i9;
import 'package:flutter_clean_architecture_2023/src/domain/usecase/clear_dog_images_usecase.dart'
    as _i12;
import 'package:flutter_clean_architecture_2023/src/domain/usecase/delete_dog_image_usecase.dart'
    as _i13;
import 'package:flutter_clean_architecture_2023/src/domain/usecase/get_dog_images_usecase.dart'
    as _i14;
import 'package:flutter_clean_architecture_2023/src/domain/usecase/save_dog_image_usecase.dart'
    as _i11;
import 'package:flutter_clean_architecture_2023/src/presentation/bloc/dog_images_bloc.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    await gh.factoryAsync<_i4.HiveService>(
      () => appModule.hiveService,
      preResolve: true,
    );
    gh.singleton<_i5.LocalDataSource>(
      _i5.LocalDataSource(gh<_i4.HiveService>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i6.RemoteDataSource>(() => appModule.remoteDataSource);
    gh.lazySingleton<_i7.LocalDataRepository>(
        () => _i8.LocalDataRepositoryImpl(gh<_i5.LocalDataSource>()));
    gh.lazySingleton<_i9.RemoteDataRepository>(
        () => _i10.RemoteDataRepositoryImpl(gh<_i6.RemoteDataSource>()));
    gh.factory<_i11.SaveDogImageUseCase>(
        () => _i11.SaveDogImageUseCase(gh<_i7.LocalDataRepository>()));
    gh.factory<_i12.ClearDogImagesUseCase>(
        () => _i12.ClearDogImagesUseCase(gh<_i7.LocalDataRepository>()));
    gh.factory<_i13.DeleteDogImageUseCase>(
        () => _i13.DeleteDogImageUseCase(gh<_i7.LocalDataRepository>()));
    gh.factory<_i14.GetDogImagesUseCase>(() => _i14.GetDogImagesUseCase(
          gh<_i9.RemoteDataRepository>(),
          gh<_i7.LocalDataRepository>(),
        ));
    gh.factory<_i15.DogImagesBloc>(() => _i15.DogImagesBloc(
          gh<_i14.GetDogImagesUseCase>(),
          gh<_i11.SaveDogImageUseCase>(),
          gh<_i13.DeleteDogImageUseCase>(),
          gh<_i12.ClearDogImagesUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
