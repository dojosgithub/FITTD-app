import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/profile/data/datasources/profile_remote_datasource.dart';

import 'package:fitted/features/profile/domain/entities/profile_entity.dart';

import '../../data/models/update_profile_request_model.dart';
import '../entities/wishlist_entity.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileResponseEntity>> getProfile() async {
    try {
      final response = await profileRemoteDataSource.getProfile();
      return Right(
        ProfileResponseEntity(
          profile: Profile(
            id: response.data?.id,
            name: response.data?.name,
            email: response.data?.email,
            imageUrl: response.data?.image,
            wishlist: response.data?.wishlist,
            accountType: response.data?.accountType,
          ),
          message: response.message,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileResponseEntity>> updateProfile(
      UpdateProfileRequestModel request) async {
    try {
      final response = await profileRemoteDataSource.updateProfile(request);
      return Right(
        ProfileResponseEntity(
          profile: Profile(
            id: response.data?.id,
            name: response.data?.name,
            email: response.data?.email,
            imageUrl: response.data?.image,
            wishlist: response.data?.wishlist,
            accountType: response.data?.accountType,
          ),
          message: response.message,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, WishlistEntity>> getWishlist() async {
    try {
      final response = await profileRemoteDataSource.getWishlist();
      return Right(
        WishlistEntity(
          items: response.data
              .map(
                (products) => Product(
                  id: products.product!.id!,
                  name: products.product!.name!,
                  price: products.product!.price!,
                  imageUrl: products.product!.image!.primary!,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
