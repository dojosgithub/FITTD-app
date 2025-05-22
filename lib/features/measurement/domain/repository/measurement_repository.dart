import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/measurement/data/models/measurement_request_model.dart';
import 'package:fitted/features/measurement/domain/entities/measurement_entity.dart';

abstract class MeasurementRepository {
  Future<Either<Failure, MeasurementEntity>> submitMeasurement(
      MeasurementRequestModel request);
  Future<Either<Failure, MeasurementEntity>> getMeasurement();
}
