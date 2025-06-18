import '../../data/model/notification_model.dart';

class NotificationsEntity {
  final bool success;
  final List<NotificationEntity> notifications;

  NotificationsEntity({
    required this.success,
    required this.notifications,
  });
}

class NotificationEntity {
  final String id;
  final String message;
  final String title;
  final List<ReceiverEntity> receivers;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationEntity({
    required this.id,
    required this.message,
    required this.title,
    required this.receivers,
    required this.createdAt,
    required this.updatedAt,
  });
}

class ReceiverEntity {
  final String userId;
  final bool isUnRead;

  ReceiverEntity({
    required this.userId,
    required this.isUnRead,
  });
}

NotificationsEntity mapModelToEntity(NotificationsModel model) {
  return NotificationsEntity(
    success: model.success ?? false,
    notifications:
        model.notifications.map((n) => mapNotificationToEntity(n)).toList(),
  );
}

NotificationEntity mapNotificationToEntity(Notification model) {
  return NotificationEntity(
    id: model.id ?? '',
    message: model.message ?? '',
    title: model.title ?? '',
    receivers: model.receivers
        .map((receiver) => mapReceiverToEntity(receiver))
        .toList(),
    createdAt: model.createdAt ?? DateTime.now(),
    updatedAt: model.updatedAt ?? DateTime.now(),
  );
}

ReceiverEntity mapReceiverToEntity(Receiver model) {
  return ReceiverEntity(
    userId: model.userId ?? '',
    isUnRead: model.isUnRead ?? false,
  );
}
