import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/helper/image_provider/fitted_image_provider.dart';
import '../../../../../config/widgets/app_text.dart';
import '../../screen/measurement_view.dart';

class OtherMeasurements extends StatelessWidget {
  const OtherMeasurements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: otherMeasurementList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 160 / 200,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.pushNamed(otherMeasurementList[index]['route']),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 1,
                  color: AppColors.black.withValues(alpha: 0.04),
                ),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withValues(
                      alpha: 0.5,
                    ),
                    offset: Offset(3, 6),
                    blurRadius: 4,
                  )
                ]),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 160 / 98,
                  child: FittedImageProvider.roundedRect(
                    imagePath: otherMeasurementList[index]['image'],
                    childImageType: AppImageType.local,
                    boxFit: BoxFit.cover,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4.h,
                    children: [
                      AppText.poppinsSemiBold(
                        otherMeasurementList[index]['headline'],
                        fontSize: 14,
                        height: 22 / 14,
                        color: AppColors.black,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                      ),
                      AppText.poppinsRegular(
                        otherMeasurementList[index]['baseline'],
                        fontSize: 10,
                        height: 18 / 10,
                        letterSpacing: 0.15 * 10,
                        color: AppColors.black.withValues(alpha: .6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
