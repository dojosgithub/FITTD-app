import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/widgets/app_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.poppinsSemiBold(
              "Today",
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.black,
            ),
            SpacersVertical.spacer12,
            NotificationCard(
              icon: AppVectors.fire,
              isHiglighted: true,
              title: "Popular New Trending Brands",
              subTitle:
                  "Please check these popular brands. There brands contain your best fits.",
              timeStamp: "9.56 AM",
            ),
            NotificationCard(
              icon: AppVectors.warning,
              isHiglighted: false,
              title: "Complete Your Measurements",
              subTitle:
                  "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia. ",
              timeStamp: "9.56 AM",
            ),
            NotificationCard(
              icon: AppVectors.fire,
              isHiglighted: false,
              title: "New Fits",
              subTitle:
                  "Please check these popular brands. There brands contain your best fits.",
              timeStamp: "9.56 AM",
            ),
            SpacersVertical.spacer20,
            AppText.poppinsSemiBold(
              "Older",
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.black,
            ),
            SpacersVertical.spacer8,
            NotificationCard(
              icon: AppVectors.lightning,
              isHiglighted: false,
              title: "New Shorts, Jeans",
              subTitle:
                  "Please check these popular brands. There brands contain your best fits.",
              timeStamp: "1 month ago",
            ),
            NotificationCard(
              icon: AppVectors.fire,
              isHiglighted: false,
              title: "Popular Brands",
              subTitle:
                  "Please check these popular brands. There brands contain your best fits.",
              timeStamp: "1 month ago",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.isHiglighted,
    required this.title,
    required this.subTitle,
    required this.timeStamp,
    required this.icon,
  });
  final bool isHiglighted;
  final String title;
  final String subTitle;
  final String timeStamp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 94.h,
          color:
              isHiglighted ? Color(0xFF48D4B4).withValues(alpha: 0.05) : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SpacersVertical.spacer20,
                  SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: FittedImageProvider.localSvg(
                      imagePath: icon,
                      boxFit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Spacers.spacer16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.poppinsSemiBold(
                          title,
                          fontSize: 14,
                          height: 22 / 14,
                          color: AppColors.black,
                        ),
                        AppText.poppinsMedium(
                          timeStamp,
                          fontSize: 12,
                          height: 18 / 12,
                          color: AppColors.black.withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                    AppText.poppinsRegular(
                      subTitle,
                      fontSize: 12,
                      height: 18 / 12,
                      color: AppColors.black.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isHiglighted)
          Divider(
            height: 14,
            thickness: 0.7,
          )
      ],
    );
  }
}
