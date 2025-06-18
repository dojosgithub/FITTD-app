// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitted/features/notifications/domain/entity/notification_entity.dart';
import 'package:fitted/features/notifications/domain/usecase/notification_usecase.dart';

part 'event.dart';
part 'state.dart';

class NotificationBloc extends Bloc<NotificatonEvent, NotificationState> {
  final GetNotificaionsUsecase getNotificaionsUsecase;
  final MarkNotificaionsAsReadUsecase markNotificaionsAsReadUsecase;
  NotificationBloc({
    required this.getNotificaionsUsecase,
    required this.markNotificaionsAsReadUsecase,
  }) : super(NotificationState()) {
    on<GetNotificaions>((event, emit) async {
      final result = await getNotificaionsUsecase.call();
      result.fold(
        (failure) => ToastUtil.showToast(message: failure.message),
        (success) {
          final allNotifications = success.notifications;
          final now = DateTime.now();

          final today = allNotifications.where((n) {
            final date = n.createdAt;
            return date.year == now.year &&
                date.month == now.month &&
                date.day == now.day;
          }).toList();

          final older = allNotifications.where((n) {
            final date = n.createdAt;
            return !(date.year == now.year &&
                date.month == now.month &&
                date.day == now.day);
          }).toList();

          emit(state.copyWith(
            notificationsEntity: success,
            todayNotifications: today,
            olderNotifications: older,
          ));

          add(MarkNotificaionsAsRead());
        },
      );
    });

    on<MarkNotificaionsAsRead>(
      (event, emit) async {
        final unreadNotificationIds = state.notificationsEntity?.notifications
            .where((notification) {
              return notification.receivers.any((receiver) =>
                  receiver.userId == state.userId && receiver.isUnRead);
            })
            .map((notification) => notification.id)
            .toList();

        if (unreadNotificationIds != null && unreadNotificationIds.isNotEmpty) {
          for (final id in unreadNotificationIds) {
            await markNotificaionsAsReadUsecase(notificationId: id);
            add(GetNotificaions());
          }
        }
      },
    );
  }
}
