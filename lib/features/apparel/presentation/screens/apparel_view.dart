import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/apparel_header.dart';

class ApparelView extends StatelessWidget {
  const ApparelView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 22.0, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApparelHeader(),
              SpacersVertical.spacer56,
              AppText.poppinsRegular(
                "Apparel",
                fontSize: 27,
                height: 22 / 27,
                color: AppColors.tealPrimary,
              ),
              SpacersVertical.spacer36,
              GridView.builder(
                itemCount: 40,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 175 / 240,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        AppRoutesEnum.apparelDetailView.name,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 171.w,
                          height: 195.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            border: Border.all(
                              width: 1,
                              color: AppColors.black.withValues(alpha: 0.04),
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          child: FittedImageProvider.network(
                            imagePath: HomeMockData.productImg1,
                            imageSize: Size(107.w, 163.h),
                            boxFit: BoxFit.cover,
                          ),
                        ),
                        SpacersVertical.spacer8,
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.poppinsMedium(
                                "Dress",
                                fontSize: 14,
                                height: 22 / 14,
                                color: AppColors.tealPrimary,
                              ),
                              AppText.poppinsRegular(
                                "(1034)",
                                fontSize: 12,
                                height: 22 / 12,
                                color: AppColors.tealSecondary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
