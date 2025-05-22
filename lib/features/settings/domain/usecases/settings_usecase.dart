import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/settings/data/models/change_password_request_model.dart';
import 'package:fitted/features/settings/domain/repositories/settings_repository.dart';

class ChangePasswordUseCase {
  final SettingsRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, dynamic>> call(
      ChangePasswordRequestModel request) async {
    return await repository.changePassword(request);
  }
}
