import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasketo/core/networking/dio_factory.dart';
import 'package:tasketo/features/auth/data/auth_repo_imple/auth_repo_imple.dart';
import 'package:tasketo/features/auth/data/data_source/auth_api.dart';
import 'package:tasketo/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:tasketo/features/auth/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:tasketo/features/home/data/data_source/home_api.dart';
import 'package:tasketo/features/home/data/repo_imple/home_repo_imple.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';

var getIt = GetIt.instance;

void setupDependencyInjection() async {
  Dio dio = await DioFactory.getDio();

  // Auth

  getIt.registerLazySingleton<AuthApiServices>(
    () => AuthApiServices(
      dio,
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(
      apiServices: getIt<AuthApiServices>(),
    ),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      repo: getIt<AuthRepo>(),
    ),
  );

  getIt.registerFactory<LogInCubit>(
        () => LogInCubit(
      repo: getIt<AuthRepo>(),
    ),
  );

  // tasks

  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(
      dio,
    ),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImple(
      apiService: getIt<HomeApiService>(),
    ),
  );

  getIt.registerFactory<GetTasksCubit>(
    () => GetTasksCubit(
      repo: getIt<HomeRepo>(),
    ),
  );

}
