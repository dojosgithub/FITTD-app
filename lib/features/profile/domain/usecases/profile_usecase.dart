// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/profile/data/models/update_profile_request_model.dart';
import 'package:fitted/features/profile/domain/entities/wishlist_entity.dart';
import 'package:fitted/features/profile/domain/repositories/profile_repository.dart';

import '../entities/profile_entity.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, ProfileResponseEntity>> call() async {
    return await repository.getProfile();
  }
}

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, ProfileResponseEntity>> call(
      UpdateProfileRequestModel request) async {
    return await repository.updateProfile(request);
  }
}

class GetWishlistUseCase {
  final ProfileRepository repository;
  GetWishlistUseCase(
    this.repository,
  );
  Future<Either<Failure, WishlistEntity>> call() async {
    return await repository.getWishlist();
  }
}
