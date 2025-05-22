import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/settings/data/models/change_password_request_model.dart';

abstract class SettingsRepository {
  Future<Either<Failure, dynamic>> changePassword(
      ChangePasswordRequestModel request);
}
