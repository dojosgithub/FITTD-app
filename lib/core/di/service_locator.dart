import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitted/core/network/token_provider.dart';
import 'package:fitted/features/apparel/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/datasources/measurement_remote_datasources.dart';
import 'package:fitted/features/measurement/domain/repository/measurement_repository.dart';
import 'package:fitted/features/measurement/domain/repository/measurement_repositoy_impl.dart';
import 'package:fitted/features/measurement/domain/usecase/measurement_usecase.dart';
import 'package:fitted/features/profile/domain/usecases/profile_usecase.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:fitted/features/settings/domain/repositories/settings_repository.dart';
import 'package:fitted/features/settings/domain/usecases/settings_usecase.dart';
import 'package:fitted/features/settings/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/apparel/data/datasources/apparel_remotedatasource.dart';
import '../../features/apparel/domain/repositories/apparel_repository.dart';
import '../../features/apparel/domain/repositories/apparel_repository_impl.dart';
import '../../features/apparel/domain/usecases/apparel_usecase.dart';
import '../../features/profile/data/datasources/profile_remote_datasource.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/repositories/profile_repository_impl.dart';
import '../../features/settings/data/datasources/settings_remotedatasource.dart';
import '../../features/settings/domain/repositories/settings_repository_impl.dart';
import '../network/api_client.dart';
import '../network/network_info.dart';
import '../../features/auth/login/data/datasources/login_remote_datasources.dart';
import '../../features/auth/login/domain/respository/login_repository_impl.dart';
import '../../features/auth/login/domain/respository/login_repository.dart';
import '../../features/auth/login/domain/usecase/login_usecase.dart';

import '../../features/auth/signup/data/datasources/signup_remote_datasources.dart';
import '../../features/auth/signup/domain/repository/signup_repository_impl.dart';
import '../../features/auth/signup/domain/repository/signup_repository.dart';
import '../../features/auth/signup/domain/usecase/signup_usecase.dart';

import '../../features/auth/verify_otp/data/datasources/verfication_remote_datasources.dart';
import '../../features/auth/verify_otp/domain/repositories/otp_repository_impl.dart';
import '../../features/auth/verify_otp/domain/repositories/otp_repository.dart';
import '../../features/auth/verify_otp/domain/usecase/otp_usecase.dart';

import '../../features/auth/forgot_password/data/datasources/forgot_password_remote_datasource.dart';
import '../../features/auth/forgot_password/domain/repository/forgot_password_repository_impl.dart';
import '../../features/auth/forgot_password/domain/repository/forgot_password_repository.dart';
import '../../features/auth/forgot_password/domain/usecase/forgot_password_usecase.dart';

import '../../features/auth/login/presentation/bloc/bloc.dart';
import '../../features/auth/signup/presentation/bloc/bloc.dart';
import '../../features/auth/verify_otp/presentation/bloc/bloc.dart';
import '../../features/auth/forgot_password/bloc/bloc.dart';
import '../../features/measurement/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      Connectivity(),
    ),
  );
  sl.registerLazySingleton<TokenProvider>(
    () => TokenProvider(),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      networkInfo: sl(),
      tokenProvider: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<VerificationRemoteDataSource>(
    () => VerificationRemoteDataSourceImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<ForgotPasswordRemoteDatasource>(
    () => ForgotPasswordRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<MeasurementRemoteDataSource>(
    () => MeasurementRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ApparelRemoteDataSource>(
    () => ApparelRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<OtpVerificationRepository>(
    () => OtpVerificationRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<ForgotPasswordRepository>(
    () => ForgotPasswordRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<MeasurementRepository>(
    () => MeasurementRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<ApparelRepository>(
    () => ApparelRepositoryImpl(
      sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(
    () => LoginUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyOtpUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyEmailOtpUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ForgotPasswordUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdatePasswordUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => AddMeasurementUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetMeasurementUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetProfileUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateProfileUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ChangePasswordUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteAccountUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ApparelUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetCategoryProductsUseCase(
      sl(),
    ),
  );

  // Blocs
  sl.registerFactory(
    () => LoginBloc(
      loginUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SignInBloc(
      signUpUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => OtpBloc(
      verifyEmailOtpUseCase: sl(),
      verifyOtpUseCase: sl(),
      loginUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ForgotPasswordBloc(
      forgotPasswordUsecase: sl(),
      changePasswordUsecase: sl(),
    ),
  );
  sl.registerFactory(
    () => MeasurementBloc(
      addMeasurementsUseCase: sl(),
      getMeasurementsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SettingsBloc(
      changePasswordUseCase: sl(),
      deleteAccountUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ProfileBloc(
      profileUseCase: sl(),
      updateProfileUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ApparelBloc(
      apparelUsecase: sl(),
      getCategoryProductsUseCase: sl(),
    ),
  );
}
