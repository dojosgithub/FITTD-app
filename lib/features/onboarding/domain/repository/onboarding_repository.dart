import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/onboarding/data/models/onboarding_request_model.dart';
import 'package:fitted/features/onboarding/domain/entities/onboarding_entity.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, OnboardingEntity>> submitMeasurement(
      OnboardingRequestModel request);
}
