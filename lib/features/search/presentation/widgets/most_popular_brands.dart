import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../apparel/presentation/bloc/bloc.dart';

class MostPopularBrandsWidget extends StatelessWidget {
  const MostPopularBrandsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.poppinsSemiBold(
          "Most Popular Brands",
          fontSize: 16,
          color: AppColors.black,
        ),
        SpacersVertical.spacer6,
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20.w,
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            return (index == 6 || index == 8)
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
                    child: Container(
                      padding: EdgeInsets.only(
                          top: index == 1 ? 10.h : 0, left: 12, right: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                      ),
                      margin: EdgeInsets.all(12),
                      child: FittedImageProvider.localSvg(
                        imagePath: brands[index]['icon'],
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
