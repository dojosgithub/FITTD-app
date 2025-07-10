import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/apparel/presentation/bloc/bloc.dart';
import 'package:fitted/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BrandsYouLoveWidget extends StatelessWidget {
  const BrandsYouLoveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppText.poppinsSemiBold(
          "Brands You Love",
          fontSize: 16,
          color: AppColors.black,
        ),
        SizedBox(
          height: 85.h,
          child: ListView.separated(
            itemCount: brands.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => Spacers.spacer16,
            itemBuilder: (context, index) => (index == 6 || index == 8)
                ? SizedBox.shrink()
                : GestureDetector(
                    onTap: () {
                      context.read<ApparelBloc>().add(
                            SetBrand(
                              brand: brands[index]['name'],
                            ),
                          );
                      context.pushNamed(
                        AppRoutesEnum.main.name,
                        extra: {"index": 1},
                      );
                    },
                    child: Column(
                      spacing: 10.h,
                      children: [
                        Container(
                          height: 52.h,
                          width: 52.w,
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                          ),
                          child: FittedImageProvider.localSvg(
                            imagePath: brands[index]['icon'],
                          ),
                        ),
                        AppText.poppinsMedium(
                          brands[index]['displayName'],
                          fontSize: 10,
                          height: 18 / 10,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
