// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/settings/data/datasources/settings_remotedatasource.dart';
import 'package:fitted/features/settings/data/models/change_password_request_model.dart';
import 'package:fitted/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  SettingsRepositoryImpl(
    this.settingsRemoteDataSource,
  );
  @override
  Future<Either<Failure, dynamic>> changePassword(
      ChangePasswordRequestModel request) async {
    try {
      final response = await settingsRemoteDataSource.changePassword(request);

      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
