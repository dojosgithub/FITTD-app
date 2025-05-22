import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/profile/data/models/update_profile_request_model.dart';

import '../entities/profile_entities.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponseEntity>> getProfile();
  Future<Either<Failure, ProfileResponseEntity>> updateProfile(
      UpdateProfileRequestModel request);
}
