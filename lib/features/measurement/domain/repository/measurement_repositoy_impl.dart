import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/datasources/measurement_remote_datasources.dart';
import '../../data/models/measurement_request_model.dart';
import '../entities/measurement_entity.dart';
import 'measurement_repository.dart';

class MeasurementRepositoryImpl implements MeasurementRepository {
  final MeasurementRemoteDataSource remoteDataSource;

  MeasurementRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MeasurementEntity>> submitMeasurement(
      MeasurementRequestModel request) async {
    try {
      final responseModel = await remoteDataSource.submitMeasurement(request);
      return Right(responseModel.data);
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MeasurementEntity>> getMeasurement() async {
    try {
      final responseModel = await remoteDataSource.getMeasurement();

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
