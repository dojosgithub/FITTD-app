import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';

import '../entity/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationsEntity>> getNotificaions();
  Future<Either<Failure, dynamic>> marksNotificationsAsRead(
      {required String notificationId});
}
