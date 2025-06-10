import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppText.poppinsSemiBold(
          "Recent searches",
          fontSize: 16,
          color: AppColors.black,
        ),
        SizedBox(
          height: 107.h,
          child: ListView.separated(
            itemCount: HomeMockData.recentSearches.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => Spacers.spacer16,
            itemBuilder: (context, index) => Column(
              spacing: 10.h,
              children: [
                FittedImageProvider.roundedRect(
                  imagePath: HomeMockData.recentSearches[index]['img'],
                  childImageType: AppImageType.network,
                  boxFit: BoxFit.cover,
                  imageSize: Size(52.w, 52.h),
                  borderRadius: BorderRadius.circular(180.r),
                ),
                SizedBox(
                  width: 52.w,
                  child: AppText.poppinsMedium(
                    HomeMockData.recentSearches[index]['title'],
                    fontSize: 14,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    color: AppColors.black.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
