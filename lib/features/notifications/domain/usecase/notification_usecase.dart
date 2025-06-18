import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/notifications/domain/entity/notification_entity.dart';
import 'package:fitted/features/notifications/domain/repository/notification_repository.dart';

class GetNotificaionsUsecase {
  final NotificationRepository notificationRepository;
  GetNotificaionsUsecase(this.notificationRepository);

  Future<Either<Failure, NotificationsEntity>> call() async {
    final result = await notificationRepository.getNotificaions();

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}

class MarkNotificaionsAsReadUsecase {
  final NotificationRepository notificationRepository;
  MarkNotificaionsAsReadUsecase(this.notificationRepository);

  Future<Either<Failure, dynamic>> call(
      {required String notificationId}) async {
    final result = await notificationRepository.marksNotificationsAsRead(
        notificationId: notificationId);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}
