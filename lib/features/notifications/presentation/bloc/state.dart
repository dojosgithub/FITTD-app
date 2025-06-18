// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bloc.dart';

class NotificationState extends Equatable {
  final NotificationsEntity? notificationsEntity;
  final List<NotificationEntity> todayNotifications;
  final List<NotificationEntity> olderNotifications;
  final String userId = SharedPrefsStorage.getUserId()!;
  NotificationState(
      {this.notificationsEntity,
      this.olderNotifications = const [],
      this.todayNotifications = const []});

  NotificationState copyWith({
    NotificationsEntity? notificationsEntity,
    List<NotificationEntity>? olderNotifications,
    List<NotificationEntity>? todayNotifications,
  }) {
    return NotificationState(
      notificationsEntity: notificationsEntity ?? this.notificationsEntity,
      olderNotifications: olderNotifications ?? this.olderNotifications,
      todayNotifications: todayNotifications ?? this.todayNotifications,
    );
  }

  @override
  List<Object?> get props =>
      [notificationsEntity, olderNotifications, todayNotifications];
}
