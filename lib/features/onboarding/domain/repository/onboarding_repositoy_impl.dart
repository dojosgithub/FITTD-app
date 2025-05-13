import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/datasources/onboarding_remote_datasources.dart';
import '../../data/models/onboarding_request_model.dart';
import '../entities/onboarding_entity.dart';
import 'onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;

  OnboardingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OnboardingEntity>> submitMeasurement(
      OnboardingRequestModel request) async {
    try {
      final responseModel = await remoteDataSource.submitMeasurement(request);

      print(responseModel.data);
      return Right(responseModel.data);
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
