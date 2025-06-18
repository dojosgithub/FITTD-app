// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/notifications/data/datasource/notification_remote_datasource.dart';
import 'package:fitted/features/notifications/domain/entity/notification_entity.dart';

import 'notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationRemoteDatasource remoteDataSource;
  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, NotificationsEntity>> getNotificaions() async {
    try {
      final notificationResponse = await remoteDataSource.getNotificaions();
      final entity = mapModelToEntity(notificationResponse);
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> marksNotificationsAsRead(
      {required String notificationId}) async {
    try {
      final notificationResponse = await remoteDataSource
          .marksNotificationsAsRead(notificationId: notificationId);

      return Right(notificationResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
