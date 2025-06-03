// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/home/domain/repositories/home_repository.dart';

class GetTrendingProductsUseCase {
  final HomeRepository repository;

  GetTrendingProductsUseCase(this.repository);

  Future<Either<Failure, dynamic>> call() async {
    return await repository.getTrendingProducts();
  }
}

// class DeleteAccountUseCase {
//   final SettingsRepository repository;
//   DeleteAccountUseCase(
//     this.repository,
//   );
//   Future<Either<Failure, dynamic>> call(
//       DeleteAccountRequestModel request) async {
//     return await repository.deleteAccount(request);
//   }
// }
