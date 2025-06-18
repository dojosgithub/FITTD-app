import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/notifications/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../widgets/notification_card.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    context.read<NotificationBloc>().add(GetNotificaions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: AppText.poppinsMedium(
          "Notification",
          fontSize: 16,
          height: 24 / 16,
          color: AppColors.black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state.notificationsEntity == null) {
              return LoadingIndicator();
            } else {
              final todayNotifications = state.todayNotifications;
              final olderNotifications = state.olderNotifications;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        if (todayNotifications.isNotEmpty) ...[
                          AppText.poppinsSemiBold(
                            "Today",
                            fontSize: 14,
                            height: 22 / 14,
                            color: AppColors.black,
                          ),
                          SpacersVertical.spacer12,
                          ...todayNotifications.map(
                            (notification) => NotificationCard(
                              icon: AppVectors.fire,
                              isHiglighted: notification.receivers.any(
                                (e) => e.userId == state.userId && e.isUnRead,
                              ),
                              title: notification.title,
                              subTitle: notification.message,
                              timeStamp: DateFormat.jm()
                                  .format(notification.createdAt),
                            ),
                          ),
                        ],
                        if (olderNotifications.isNotEmpty) ...[
                          AppText.poppinsSemiBold(
                            "Older",
                            fontSize: 14,
                            height: 22 / 14,
                            color: AppColors.black,
                          ),
                          SpacersVertical.spacer12,
                          ...olderNotifications.map(
                            (notification) => NotificationCard(
                              icon: AppVectors.fire,
                              isHiglighted: notification.receivers.any(
                                (e) => e.userId == state.userId && e.isUnRead,
                              ),
                              title: notification.title,
                              subTitle: notification.message,
                              timeStamp: DateFormat.jm()
                                  .format(notification.createdAt),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
