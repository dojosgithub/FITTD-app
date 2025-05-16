import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/measurement_request_model.dart';
import '../entities/measurement_entity.dart';
import '../repository/measurement_repository.dart';

class AddMeasurementUseCase {
  final MeasurementRepository repository;

  AddMeasurementUseCase(this.repository);

  Future<Either<Failure, MeasurementEntity>> call(
      MeasurementRequestModel request) async {
    return await repository.submitMeasurement(request);
  }
}
