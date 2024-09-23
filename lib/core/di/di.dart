import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasketo/core/networking/dio_factory.dart';
import 'package:tasketo/features/auth/data/auth_repo_imple/auth_repo_imple.dart';
import 'package:tasketo/features/auth/data/data_source/auth_api.dart';
import 'package:tasketo/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

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
}
