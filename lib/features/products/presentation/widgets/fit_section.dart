import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import '../../data/lists/fit_list.dart';

class FitSection extends StatelessWidget {
  const FitSection({
    super.key,
    required this.fitType,
  });
  final String fitType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.poppinsSemiBold(
          "Fit",
          fontSize: 16,
          height: 24 / 16,
          color: AppColors.tealPrimary,
        ),
        SpacersVertical.spacer8,
        SizedBox(
          height: 34.h,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fitList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => Spacers.spacer10,
              itemBuilder: (context, index) {
                return Container(
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: fitType == fitList[index].toLowerCase()
                        ? AppColors.orangePrimary
                        : null,
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(
                      color: fitType == fitList[index].toLowerCase()
                          ? AppColors.orangePrimary
                          : AppColors.grey,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: AppText.poppinsRegular(
                    fitList[index],
                    fontSize: 12,
                    height: 18 / 12,
                    color: fitType == fitList[index].toLowerCase()
                        ? AppColors.white
                        : AppColors.black,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
