import 'package:fitted/features/auth/forgot_password/bloc/bloc.dart';
import 'package:fitted/features/auth/forgot_password/data/datasources/forgot_password_remote_datasource.dart';
import 'package:fitted/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:fitted/features/auth/forgot_password/domain/repository/forgot_password_repository_impl.dart';
import 'package:fitted/features/auth/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'package:fitted/features/auth/verify_otp/bloc/bloc.dart';
import 'package:fitted/features/auth/verify_otp/data/datasources/verfication_remote_datasources.dart';
import 'package:fitted/features/auth/verify_otp/domain/repositories/otp_repository.dart';
import 'package:fitted/features/auth/verify_otp/domain/repositories/otp_repository_impl.dart';
import 'package:fitted/features/auth/verify_otp/domain/usecase/otp_usecase.dart';
import 'package:fitted/features/onboarding/bloc/bloc.dart';

import '../../features/auth/login/bloc/bloc.dart';
import '../../features/auth/login/data/datasources/login_remote_datasources.dart';
import '../../features/auth/login/domain/respository/login_repository_impl.dart';
import '../../features/auth/login/domain/respository/login_repository.dart';
import '../../features/auth/login/domain/usecase/login_usecase.dart';

import '../../features/auth/signup/bloc/bloc.dart';
import '../../features/auth/signup/data/datasources/signup_remote_datasources.dart';
import '../../features/auth/signup/domain/repository/signup_repository_impl.dart';
import '../../features/auth/signup/domain/repository/signup_repository.dart';
import '../../features/auth/signup/domain/usecase/signup_usecase.dart';

import '../network/api_client.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<ApiClient>(() => ApiClient(Dio()));

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<VerificationRemoteDataSource>(
    () => VerificationRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ForgotPasswordRemoteDatasource>(
    () => ForgotPasswordRemoteDatasourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<OtpVerificationRepository>(
    () => OtpVerificationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ForgotPasswordRepository>(
    () => ForgotPasswordRepositoryImpl(sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton(() => VerifyEmailOtpUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUsecase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUsecase(sl()));

  // Blocs
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => SignInBloc(signUpUseCase: sl()));
  sl.registerFactory(() => OtpBloc(
        verifyEmailOtpUseCase: sl(),
        verifyOtpUseCase: sl(),
      ));
  sl.registerFactory(() => ForgotPasswordBloc(
        forgotPasswordUsecase: sl(),
        changePasswordUsecase: sl(),
      ));

  sl.registerFactory(() => OnboardingBloc());
}
