import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/onboarding_request_model.dart';
import '../entities/onboarding_entity.dart';
import '../repository/onboarding_repository.dart';

class OnboardUserUseCase {
  final OnboardingRepository repository;

  OnboardUserUseCase(this.repository);

  Future<Either<Failure, OnboardingEntity>> call(
      OnboardingRequestModel request) async {
    return await repository.submitMeasurement(request);
  }
}
