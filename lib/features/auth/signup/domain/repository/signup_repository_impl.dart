import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import '../../data/datasources/signup_remote_datasources.dart';
import '../../data/models/signup_request_model.dart';
import '../../domain/entities/signup_response.dart';
import '../../domain/repository/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource dataSource;

  SignUpRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, SignUpResponse>> signUp(
      SignUpRequestModel model) async {
    try {
      final responseModel = await dataSource.signUp(model);
      return Right(
        SignUpResponse(
          message: responseModel.message,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
