// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/settings/data/models/change_password_request_model.dart';
import 'package:fitted/features/settings/data/models/delete_account_request_model.dart';
import 'package:fitted/features/settings/domain/repositories/settings_repository.dart';

class ChangePasswordUseCase {
  final SettingsRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, dynamic>> call(
      ChangePasswordRequestModel request) async {
    return await repository.changePassword(request);
  }
}

class DeleteAccountUseCase {
  final SettingsRepository repository;
  DeleteAccountUseCase(
    this.repository,
  );
  Future<Either<Failure, dynamic>> call(
      DeleteAccountRequestModel request) async {
    return await repository.deleteAccount(request);
  }
}
