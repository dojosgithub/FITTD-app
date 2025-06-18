// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/notifications/data/model/notification_model.dart';

abstract class NotificationRemoteDatasource {
  Future<NotificationsModel> getNotificaions();
  Future marksNotificationsAsRead({required String notificationId});
}

class NotificationRemoteDatasourceImpl extends NotificationRemoteDatasource {
  final ApiClient apiClient;
  NotificationRemoteDatasourceImpl(this.apiClient);
  @override
  Future<NotificationsModel> getNotificaions() async {
    final response = await apiClient.get("/api/notification/");
    return NotificationsModel.fromJson(response.data);
  }

  @override
  Future marksNotificationsAsRead({required String notificationId}) async {
    await apiClient
        .put("/api/notification/mark-as-read?notificationId=$notificationId");
  }
}
