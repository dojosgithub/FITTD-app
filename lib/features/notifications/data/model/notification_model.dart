class NotificationsModel {
  NotificationsModel({
    required this.success,
    required this.notifications,
  });

  final bool? success;
  final List<Notification> notifications;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      success: json["success"],
      notifications: json["notifications"] == null
          ? []
          : List<Notification>.from(
              json["notifications"]!.map((x) => Notification.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "notifications": notifications.map((x) => x.toJson()).toList(),
      };
}

class Notification {
  Notification({
    required this.id,
    required this.message,
    required this.title,
    required this.receivers,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? message;
  final String? title;
  final List<Receiver> receivers;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json["_id"],
      message: json["message"],
      title: json["title"],
      receivers: json["receivers"] == null
          ? []
          : List<Receiver>.from(
              json["receivers"]!.map((x) => Receiver.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "message": message,
        "title": title,
        "receivers": receivers.map((x) => x.toJson()).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Receiver {
  Receiver({
    required this.userId,
    required this.isUnRead,
  });

  final String? userId;
  final bool? isUnRead;

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      userId: json["userId"],
      isUnRead: json["isUnRead"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "isUnRead": isUnRead,
      };
}
